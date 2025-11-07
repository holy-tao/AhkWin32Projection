#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostStatus extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostStatus
     * @type {Guid}
     */
    static IID => Guid("{4f3e1ce2-86b2-4c7a-9c65-d0a9d0eecf44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PollUserInterrupt"]

    /**
     * 
     * @returns {Boolean} 
     */
    PollUserInterrupt() {
        result := ComCall(3, this, "int*", &interruptRequested := 0, "HRESULT")
        return interruptRequested
    }
}
