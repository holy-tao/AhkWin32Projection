#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the properties representing security algorithm knobs.
 * @remarks
 * 
 * All properties defined by the keys here have reasonable defaults; so
 * specifying them is optional.  In the common case, one should be able
 * to create a <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_algorithm_suite">WS_SECURITY_ALGORITHM_SUITE</a> without setting any of
 * the properties below.
 *             
 * 
 * <div class="alert"><b>Note</b>  This <b>enum</b> is reserved for future use and currently contains no values.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_security_algorithm_property_id
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURITY_ALGORITHM_PROPERTY_ID extends Win32Enum{
}
