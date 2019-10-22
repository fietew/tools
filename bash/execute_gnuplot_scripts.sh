#!/bin/bash

#*****************************************************************************
# Copyright (c) 2019      Fiete Winter                                       *
#                         Institut fuer Nachrichtentechnik                   *
#                         Universitaet Rostock                               *
#                         Richard-Wagner-Strasse 31, 18119 Rostock, Germany  *
#                                                                            *
# This file is part of the supplementary material for Fiete Winter's         *
# PhD thesis                                                                 *
#                                                                            *
# You can redistribute the material and/or modify it  under the terms of the *
# GNU  General  Public  License as published by the Free Software Foundation *
# , either version 3 of the License,  or (at your option) any later version. *
#                                                                            *
# This Material is distributed in the hope that it will be useful, but       *
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY *
# or FITNESS FOR A PARTICULAR PURPOSE.                                       *
# See the GNU General Public License for more details.                       *
#                                                                            *
# You should  have received a copy of the GNU General Public License along   *
# with this program. If not, see <http://www.gnu.org/licenses/>.             *
#                                                                            *
# http://github.com/fietew/phd-thesis                 fiete.winter@gmail.com *
#*****************************************************************************

if [ $# -ne 1 ]; then
    echo "Incorrect number of arguments ($# provided, 1 expected)"
    exit 1
fi

# find gnuplot files and run them
find $1 -iname "fig*.gnu" -type f | sort -n | while read -r gnufile ; do
    # 
    directory=`dirname $gnufile`
    gnufilelocal=`basename $gnufile`
    printf "Found $gnufile, Executing ..."
    
    ( cd $directory ; gnuplot $gnufilelocal &> /dev/null; printf ", gnuplot exit code: $?\n" )
done

