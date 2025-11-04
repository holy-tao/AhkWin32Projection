#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * Walks a stack frame looking for interesting values.
 * @see https://docs.microsoft.com/windows/win32/api//callobj/nn-callobj-icallframewalker
 * @namespace Windows.Win32.System.Com.CallObj
 * @version v4.0.30319
 */
class ICallFrameWalker extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICallFrameWalker
     * @type {Guid}
     */
    static IID => Guid("{08b23919-392d-11d2-b8a4-00c04fb9618a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnWalkInterface"]

    /**
     * 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Pointer<Void>>} ppvInterface 
     * @param {BOOL} fIn 
     * @param {BOOL} fOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallframewalker-onwalkinterface
     */
    OnWalkInterface(iid, ppvInterface, fIn, fOut) {
        ppvInterfaceMarshal := ppvInterface is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", iid, ppvInterfaceMarshal, ppvInterface, "int", fIn, "int", fOut, "HRESULT")
        return result
    }
}
