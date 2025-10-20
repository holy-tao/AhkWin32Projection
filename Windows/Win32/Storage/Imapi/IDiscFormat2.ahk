#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * This is a base interface. Use the following interfaces which inherit this interface IDiscFormat2Data, IDiscFormat2Erase, IDiscFormat2TrackAtOnce, IDiscFormat2RawCD
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-idiscformat2
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IDiscFormat2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDiscFormat2
     * @type {Guid}
     */
    static IID => Guid("{27354152-8f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsRecorderSupported", "IsCurrentMediaSupported", "get_MediaPhysicallyBlank", "get_MediaHeuristicallyBlank", "get_SupportedMediaTypes"]

    /**
     * 
     * @param {IDiscRecorder2} recorder 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2-isrecordersupported
     */
    IsRecorderSupported(recorder, value) {
        result := ComCall(7, this, "ptr", recorder, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDiscRecorder2} recorder 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2-iscurrentmediasupported
     */
    IsCurrentMediaSupported(recorder, value) {
        result := ComCall(8, this, "ptr", recorder, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2-get_mediaphysicallyblank
     */
    get_MediaPhysicallyBlank(value) {
        result := ComCall(9, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2-get_mediaheuristicallyblank
     */
    get_MediaHeuristicallyBlank(value) {
        result := ComCall(10, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2-get_supportedmediatypes
     */
    get_SupportedMediaTypes(value) {
        result := ComCall(11, this, "ptr*", value, "HRESULT")
        return result
    }
}
