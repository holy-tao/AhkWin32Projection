#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The **IDXCoreAdapter** interface implements methods for retrieving details about an adapter item.
 * @remarks
 * 
  * An adapter's properties are established at the time the adapter starts, and they're immutable for the lifetime of the adapter. This is in contrast to an adapter's state, which can be queried or set, and the values of which can change over time.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxcore_interface/nn-dxcore_interface-idxcoreadapter
 * @namespace Windows.Win32.Graphics.DXCore
 * @version v4.0.30319
 */
class IDXCoreAdapter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXCoreAdapter
     * @type {Guid}
     */
    static IID => Guid("{f0db4c7f-fe5a-42a2-bd62-f2a6cf6fc83e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsValid", "IsAttributeSupported", "IsPropertySupported", "GetProperty", "GetPropertySize", "IsQueryStateSupported", "QueryState", "IsSetStateSupported", "SetState", "GetFactory"]

    /**
     * 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-isvalid
     */
    IsValid() {
        result := ComCall(3, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} attributeGUID 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-isattributesupported
     */
    IsAttributeSupported(attributeGUID) {
        result := ComCall(4, this, "ptr", attributeGUID, "int")
        return result
    }

    /**
     * 
     * @param {Integer} property 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-ispropertysupported
     */
    IsPropertySupported(property) {
        result := ComCall(5, this, "uint", property, "int")
        return result
    }

    /**
     * 
     * @param {Integer} property 
     * @param {Pointer} bufferSize 
     * @param {Pointer} propertyData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-getproperty
     */
    GetProperty(property, bufferSize, propertyData) {
        result := ComCall(6, this, "uint", property, "ptr", bufferSize, "ptr", propertyData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} property 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-getpropertysize
     */
    GetPropertySize(property) {
        result := ComCall(7, this, "uint", property, "ptr*", &bufferSize := 0, "HRESULT")
        return bufferSize
    }

    /**
     * 
     * @param {Integer} property 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-isquerystatesupported
     */
    IsQueryStateSupported(property) {
        result := ComCall(8, this, "uint", property, "int")
        return result
    }

    /**
     * 
     * @param {Integer} state 
     * @param {Pointer} inputStateDetailsSize 
     * @param {Pointer} inputStateDetails 
     * @param {Pointer} outputBufferSize 
     * @param {Pointer} outputBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-querystate
     */
    QueryState(state, inputStateDetailsSize, inputStateDetails, outputBufferSize, outputBuffer) {
        result := ComCall(9, this, "uint", state, "ptr", inputStateDetailsSize, "ptr", inputStateDetails, "ptr", outputBufferSize, "ptr", outputBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} property 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-issetstatesupported
     */
    IsSetStateSupported(property) {
        result := ComCall(10, this, "uint", property, "int")
        return result
    }

    /**
     * 
     * @param {Integer} state 
     * @param {Pointer} inputStateDetailsSize 
     * @param {Pointer} inputStateDetails 
     * @param {Pointer} inputDataSize 
     * @param {Pointer} inputData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-setstate
     */
    SetState(state, inputStateDetailsSize, inputStateDetails, inputDataSize, inputData) {
        result := ComCall(11, this, "uint", state, "ptr", inputStateDetailsSize, "ptr", inputStateDetails, "ptr", inputDataSize, "ptr", inputData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-getfactory
     */
    GetFactory(riid) {
        result := ComCall(12, this, "ptr", riid, "ptr*", &ppvFactory := 0, "HRESULT")
        return ppvFactory
    }
}
