#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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
     * @returns {VARIANT} 
     */
    get_StreamTime() {
        Time := VARIANT()
        result := ComCall(7, this, "ptr", Time, "HRESULT")
        return Time
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Length() {
        Length := VARIANT()
        result := ComCall(8, this, "ptr", Length, "HRESULT")
        return Length
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TickCount() {
        result := ComCall(9, this, "int*", &TickCount := 0, "HRESULT")
        return TickCount
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_OffsetFromStart() {
        OffsetFromStart := VARIANT()
        result := ComCall(10, this, "ptr", OffsetFromStart, "HRESULT")
        return OffsetFromStart
    }
}
