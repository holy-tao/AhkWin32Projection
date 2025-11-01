#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IEnumJsStackFrames extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumJsStackFrames
     * @type {Guid}
     */
    static IID => Guid("{5e7da34b-fb51-4791-abe7-cb5bdf419755}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Reset"]

    /**
     * 
     * @param {Integer} cFrameCount 
     * @param {Pointer<JS_NATIVE_FRAME>} pFrames 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     */
    Next(cFrameCount, pFrames, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cFrameCount, "ptr", pFrames, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
