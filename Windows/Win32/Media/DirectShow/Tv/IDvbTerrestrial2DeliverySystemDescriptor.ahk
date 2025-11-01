#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbTerrestrial2DeliverySystemDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvbTerrestrial2DeliverySystemDescriptor
     * @type {Guid}
     */
    static IID => Guid("{20ee9be9-cd57-49ab-8f6e-1d07aeb8e482}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetTagExtension", "GetCentreFrequency", "GetPLPId", "GetT2SystemId", "GetMultipleInputMode", "GetBandwidth", "GetGuardInterval", "GetTransmissionMode", "GetCellId", "GetOtherFrequencyFlag", "GetTFSFlag"]

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     */
    GetTag(pbVal) {
        result := ComCall(3, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     */
    GetLength(pbVal) {
        result := ComCall(4, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     */
    GetTagExtension(pbVal) {
        result := ComCall(5, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwVal 
     * @returns {HRESULT} 
     */
    GetCentreFrequency(pdwVal) {
        result := ComCall(6, this, "uint*", pdwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     */
    GetPLPId(pbVal) {
        result := ComCall(7, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     */
    GetT2SystemId(pwVal) {
        result := ComCall(8, this, "ushort*", pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     */
    GetMultipleInputMode(pbVal) {
        result := ComCall(9, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     */
    GetBandwidth(pbVal) {
        result := ComCall(10, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     */
    GetGuardInterval(pbVal) {
        result := ComCall(11, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     */
    GetTransmissionMode(pbVal) {
        result := ComCall(12, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     */
    GetCellId(pwVal) {
        result := ComCall(13, this, "ushort*", pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     */
    GetOtherFrequencyFlag(pbVal) {
        result := ComCall(14, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     */
    GetTFSFlag(pbVal) {
        result := ComCall(15, this, "char*", pbVal, "HRESULT")
        return result
    }
}
