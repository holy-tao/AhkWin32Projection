#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKsObject
     * @type {Guid}
     */
    static IID => Guid("{423c13a2-2070-11d0-9ef7-00aa00a216a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["KsGetObjectHandle"]

    /**
     * 
     * @returns {HANDLE} 
     */
    KsGetObjectHandle() {
        result := ComCall(3, this, "ptr")
        return result
    }
}
