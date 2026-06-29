#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MF_MSE_APPEND_MODE.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class IMFSourceBufferAppendMode extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSourceBufferAppendMode
     * @type {Guid}
     */
    static IID => Guid("{19666fb4-babe-4c55-bc03-0a074da37e2a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAppendMode", "SetAppendMode"]

    /**
     * 
     * @returns {MF_MSE_APPEND_MODE} 
     */
    GetAppendMode() {
        result := ComCall(3, this, "int")
        return result
    }

    /**
     * 
     * @param {MF_MSE_APPEND_MODE} _mode 
     * @returns {HRESULT} 
     */
    SetAppendMode(_mode) {
        result := ComCall(4, this, "int", _mode, "HRESULT")
        return result
    }
}
