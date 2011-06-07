"""0MQ Context class declaration."""

#
#    Copyright (c) 2010 Brian E. Granger
#
#    This file is part of pyzmq.
#
#    pyzmq is free software; you can redistribute it and/or modify it under
#    the terms of the Lesser GNU General Public License as published by
#    the Free Software Foundation; either version 3 of the License, or
#    (at your option) any later version.
#
#    pyzmq is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    Lesser GNU General Public License for more details.
#
#    You should have received a copy of the Lesser GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

#-----------------------------------------------------------------------------
# Code
#-----------------------------------------------------------------------------

cdef class Context:
    """Manage the lifecycle of a 0MQ context."""

    cdef void *handle         # The C handle for the underlying zmq object.
    cdef void ** _sockets     # A C-array containg socket handles
    cdef size_t n_sockets         # the number of sockets
    cdef size_t max_sockets         # the size of the _sockets array
    cdef public object closed # bool property for a closed context.
    # helpers for events on _sockets in Socket.__cinit__()/close()
    cdef inline void _add_socket(self, void* handle)
    cdef inline void _remove_socket(self, void* handle)

