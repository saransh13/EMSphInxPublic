# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                                                                     #
# Copyright (c) 2019, De Graef Group, Carnegie Mellon University      #
# All rights reserved.                                                #
#                                                                     #
# Author: William C. Lenthe                                           #
#                                                                     #
# This package is free software; you can redistribute it and/or       #
# modify it under the terms of the GNU General Public License as      #
# published by the Free Software Foundation; either version 2 of the  #
# License, or (at your option) any later version.                     #
#                                                                     #
# This program is distributed in the hope that it will be useful,     #
# but WITHOUT ANY WARRANTY; without even the implied warranty of      #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the       #
# GNU General Public License for more details.                        #
#                                                                     #
# You should have received a copy of the GNU General Public License   #
# along with this program; if not, check the Free Software Foundation #
# website: <https://www.gnu.org/licenses/old-licenses/gpl-2.0.html>   #
#                                                                     #
#                                                                     #
# Interested in a commercial license? Contact:                        #
#                                                                     #
# Center for Technology Transfer and Enterprise Creation              #
# 4615 Forbes Avenue, Suite 302                                       #
# Pittsburgh, PA 15213                                                #
#                                                                     #
# phone. : 412.268.7393                                               #
# email  : innovation@cmu.edu                                         #
# website: https://www.cmu.edu/cttec/                                 #
#                                                                     #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

################################################
#                                              #
#                   wxWidgets                  #
#                                              #
################################################


# set(wxWidgets_LIBRARIES "") # store all wxWidgets libraries to link against here

if(EMSPHINX_BUILD_wxWidgets)
	
	include(FetchContent)
	FetchContent_Declare(
		wxWidgets
		GIT_REPOSITORY "https://github.com/wxWidgets/wxWidgets"
		GIT_TAG        "v3.1.2"
		GIT_PROGRESS   TRUE
		GIT_SHALLOW    TRUE
	)
	set(FETCHCONTENT_QUIET NO)
	if(NOT EMSPHINX_BUILD_SHARED)
		set(wxBUILD_SHARED OFF CACHE BOOL "Build wx libraries as shared libs")
	endif()

	# set(wxBUILD_PRECOMP OFF) # this prevents errors on recompile after the git hash changes
	if(UNIX AND NOT APPLE)
		message (WARNING "wxWidgets needs gtk3, make sure you have it with e.g. 'apt-get install libgtk-3-dev build-essential'")
		set(wxBUILD_TOOLKIT gtk3 CACHE STRING "Toolkit used by wxWidgets")
	endif()

	if(APPLE)
		set(wxUSE_WEBKIT OFF CACHE BOOL "use wxWebKitCtrl (Mac-only, use wxWebView instead)")
		set(wxUSE_WEBVIEW_WEBKIT OFF CACHE BOOL "use wxWebView WebKit background")
	endif()

	FetchContent_MakeAvailable(wxWidgets)

else(EMSPHINX_BUILD_wxWidgets)
	# SET(wxWidgets_ROOT_DIR <wxWidgets Directory>)
	# SET(wxWidgets_CONFIGURATION mswud)
	find_package(WxWidgets COMPONENTS core base REQUIRED)
	include(${wxWidgets_USE_FILE})
endif(EMSPHINX_BUILD_wxWidgets)
