#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechRecoResultTimes extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechRecoResultTimes
     * @type {Guid}
     */
    static IID => Guid("{62b3b8fb-f6e7-41be-bdcb-056b1c29efc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StreamTime", "get_Length", "get_TickCount", "get_OffsetFromStart"]

    /**
     * 
     * @param {Pointer<VARIANT>} Time 
     * @returns {HRESULT} 
     */
    get_StreamTime(Time) {
        result := ComCall(7, this, "ptr", Time, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Length 
     * @returns {HRESULT} 
     */
    get_Length(Length) {
        result := ComCall(8, this, "ptr", Length, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} TickCount 
     * @returns {HRESULT} 
     */
    get_TickCount(TickCount) {
        TickCountMarshal := TickCount is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, TickCountMarshal, TickCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} OffsetFromStart 
     * @returns {HRESULT} 
     */
    get_OffsetFromStart(OffsetFromStart) {
        result := ComCall(10, this, "ptr", OffsetFromStart, "HRESULT")
        return result
    }
}
