#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Implement this interface to receive notifications when events occur.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-_irdpsessionevents
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class _IRDPSessionEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for _IRDPSessionEvents
     * @type {Guid}
     */
    static IID => Guid("{98a97042-6698-40e9-8efd-b3200990004b}")

    /**
     * The class identifier for _IRDPSessionEvents
     * @type {Guid}
     */
    static CLSID => Guid("{98a97042-6698-40e9-8efd-b3200990004b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
