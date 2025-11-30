#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of event that the ITSGAccountingEngine::DoAccounting method is being notified of.
 * @see https://docs.microsoft.com/windows/win32/api//tsgpolicyengine/ne-tsgpolicyengine-aaaccountingdatatype
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class AAAccountingDataType extends Win32Enum{

    /**
     * A new session was created.
     * 
     * The following fields in the <a href="https://docs.microsoft.com/windows/win32/api/tsgpolicyengine/ns-tsgpolicyengine-aaaccountingdata">AAAccountingData</a> structure represented by the <i>accountingData</i> parameter are valid:
     * 
     * <ul>
     * <li><b>userName</b></li>
     * <li><b>clientName</b></li>
     * <li><b>authType</b></li>
     * <li><b>mainSessionId</b></li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static AA_MAIN_SESSION_CREATION => 0

    /**
     * A new subsession was created by an  existing connection.
     * 
     * The following fields in the <a href="https://docs.microsoft.com/windows/win32/api/tsgpolicyengine/ns-tsgpolicyengine-aaaccountingdata">AAAccountingData</a> structure represented by the <i>accountingData</i> parameter are valid:
     * 
     * <ul>
     * <li><b>userName</b></li>
     * <li><b>resourceName</b></li>
     * <li><b>portNumber</b></li>
     * <li><b>protocolName</b></li>
     * <li><b>mainSessionId</b></li>
     * <li><b>subSessionId</b></li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static AA_SUB_SESSION_CREATION => 1

    /**
     * A subsession was closed.
     * 
     * The following fields in the <a href="https://docs.microsoft.com/windows/win32/api/tsgpolicyengine/ns-tsgpolicyengine-aaaccountingdata">AAAccountingData</a> structure represented by the <i>accountingData</i> parameter are valid:
     * 
     * <ul>
     * <li><b>numberOfBytesTransfered</b></li>
     * <li><b>numberOfBytesReceived</b></li>
     * <li><b>mainSessionId</b></li>
     * <li><b>subSessionId</b></li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static AA_SUB_SESSION_CLOSED => 2

    /**
     * A connection was closed.
     * 
     * The following fields in the <a href="https://docs.microsoft.com/windows/win32/api/tsgpolicyengine/ns-tsgpolicyengine-aaaccountingdata">AAAccountingData</a> structure represented by the <i>accountingData</i> parameter are valid:
     * 
     * <ul>
     * <li><b>mainSessionId</b></li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static AA_MAIN_SESSION_CLOSED => 3
}
