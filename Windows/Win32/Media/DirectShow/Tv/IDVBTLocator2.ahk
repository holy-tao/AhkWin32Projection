#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDVBTLocator.ahk

/**
 * Gets or sets tuning information for a Digital Video Broadcast - Second Generation Terrestrial (DVB-T2) network.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDVBTLocator2)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-idvbtlocator2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDVBTLocator2 extends IDVBTLocator{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDVBTLocator2
     * @type {Guid}
     */
    static IID => Guid("{448a2edf-ae95-4b43-a3cc-747843c453d4}")

    /**
     * The class identifier for DVBTLocator2
     * @type {Guid}
     */
    static CLSID => Guid("{efe3fa02-45d7-4920-be96-53fa7f35b0e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 36

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PhysicalLayerPipeId", "put_PhysicalLayerPipeId"]

    /**
     * @type {Integer} 
     */
    PhysicalLayerPipeId {
        get => this.get_PhysicalLayerPipeId()
        set => this.put_PhysicalLayerPipeId(value)
    }

    /**
     * Identifies a Physical Layer Pipe (PLP) that carries a T2 logical data stream.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtlocator2-get_physicallayerpipeid
     */
    get_PhysicalLayerPipeId() {
        result := ComCall(36, this, "int*", &PhysicalLayerPipeIdVal := 0, "HRESULT")
        return PhysicalLayerPipeIdVal
    }

    /**
     * Identifies a Physical Layer Pipe (PLP) that carries a T2 logical data stream.
     * @param {Integer} PhysicalLayerPipeIdVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtlocator2-put_physicallayerpipeid
     */
    put_PhysicalLayerPipeId(PhysicalLayerPipeIdVal) {
        result := ComCall(37, this, "int", PhysicalLayerPipeIdVal, "HRESULT")
        return result
    }
}
