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
     * 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Void>} ppvInterface 
     * @param {BOOL} fIn 
     * @param {BOOL} fOut 
     * @returns {HRESULT} 
     */
    OnWalkInterface(iid, ppvInterface, fIn, fOut) {
        result := ComCall(3, this, "ptr", iid, "ptr", ppvInterface, "int", fIn, "int", fOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
