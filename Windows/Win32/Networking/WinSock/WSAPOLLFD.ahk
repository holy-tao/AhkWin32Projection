#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSAPOLL_EVENT_FLAGS.ahk" { WSAPOLL_EVENT_FLAGS }
#Import ".\SOCKET.ahk" { SOCKET }

/**
 * Stores socket information used by the WSAPoll function.
 * @remarks
 * The <b>WSAPOLLFD</b> structure is defined on Windows Vista and later. 
 * 
 * The <b>WSAPOLLFD</b> structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsapoll">WSAPoll</a> function to determine the status of one or more sockets. The set of sockets for which status is requested is specified in <i>fdarray</i> parameter, which is an array of <b>WSAPOLLFD</b> structures.  An application sets the appropriate flags in the <b>events</b> member of the <b>WSAPOLLFD</b> structure to specify the type of status requested for each corresponding socket.  The <b>WSAPoll</b> function returns the status of a socket in the <b>revents</b> member of the <b>WSAPOLLFD</b> structure.
 * 
 * If the <b>fd</b> member of the <b>WSAPOLLFD</b> structure is set to a negative value, the structure is ignored by the <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsapoll">WSAPoll</a> function call, and the <b>revents</b> member is cleared upon return. This is useful to applications that maintain a fixed  allocation for the <i>fdarray</i> parameter of <b>WSAPoll</b>; such applications need not waste resources compacting elements of the array for unused entries or reallocating memory. It is unnecessary to clear the <b>revents</b> member prior to calling the <b>WSAPoll</b> function.
 * @see https://learn.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsapollfd
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WSAPOLLFD {
    #StructPack 8

    /**
     * Type: <b>SOCKET</b>
     * 
     * The identifier of the socket for which to find status. This parameter is ignored if set to a negative value. See Remarks.
     */
    fd : SOCKET

    /**
     * Type: <b>short</b>
     * 
     * A set of flags indicating the type of status being requested. This must be one or more of the following.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>POLLPRI</td>
     * <td>Priority data may be read without blocking. This flag is not supported by the Microsoft Winsock provider.</td>
     * </tr>
     * <tr>
     * <td>POLLRDBAND</td>
     * <td>Priority band (out-of-band) data can be read without blocking.</td>
     * </tr>
     * <tr>
     * <td>POLLRDNORM</td>
     * <td>Normal data can be read without blocking.</td>
     * </tr>
     * <tr>
     * <td>POLLWRNORM</td>
     * <td>Normal data can be written without blocking.</td>
     * </tr>
     * </table>
     *  
     * 
     * The POLLIN flag is defined as the combination of the <b>POLLRDNORM</b>  and <b>POLLRDBAND</b> flag values. The POLLOUT flag is defined as the same as the <b>POLLWRNORM</b>  flag value.
     */
    events : WSAPOLL_EVENT_FLAGS

    /**
     * Type: <b>short</b>
     * 
     * A set of flags that indicate, upon return from the <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsapoll">WSAPoll</a> function call, the results of the status query. This can a combination of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>POLLERR</td>
     * <td>An error has occurred.</td>
     * </tr>
     * <tr>
     * <td>POLLHUP</td>
     * <td>A stream-oriented connection was either disconnected or aborted.</td>
     * </tr>
     * <tr>
     * <td>POLLNVAL</td>
     * <td>An invalid socket was used.</td>
     * </tr>
     * <tr>
     * <td>POLLPRI</td>
     * <td>Priority data may be read without blocking. This flag is not returned by the Microsoft Winsock provider.</td>
     * </tr>
     * <tr>
     * <td>POLLRDBAND</td>
     * <td>Priority band (out-of-band) data may be read without blocking.</td>
     * </tr>
     * <tr>
     * <td>POLLRDNORM</td>
     * <td>Normal data may be read without blocking.</td>
     * </tr>
     * <tr>
     * <td>POLLWRNORM</td>
     * <td>Normal data may be written without blocking.</td>
     * </tr>
     * </table>
     *  
     * 
     * The POLLIN flag is defined as the combination of the <b>POLLRDNORM</b>  and <b>POLLRDBAND</b> flag values. The POLLOUT flag is defined as the same as the <b>POLLWRNORM</b>  flag value.
     * 
     * For sockets that do not satisfy the status query, and have no error, the <b>revents</b> member is set to zero upon return.
     */
    revents : WSAPOLL_EVENT_FLAGS

}
