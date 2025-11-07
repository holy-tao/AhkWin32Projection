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
     * @returns {Integer} 
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetTagExtension() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCentreFrequency() {
        result := ComCall(6, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPLPId() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetT2SystemId() {
        result := ComCall(8, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMultipleInputMode() {
        result := ComCall(9, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetBandwidth() {
        result := ComCall(10, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetGuardInterval() {
        result := ComCall(11, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetTransmissionMode() {
        result := ComCall(12, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCellId() {
        result := ComCall(13, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetOtherFrequencyFlag() {
        result := ComCall(14, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetTFSFlag() {
        result := ComCall(15, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }
}
