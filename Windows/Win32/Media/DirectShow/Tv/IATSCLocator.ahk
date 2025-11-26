#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDigitalLocator.ahk

/**
 * The IATSCLocator interface is implemented on the ATSCLocator object and contains methods that enable the network provider to determine the physical channel and transport stream ID of an ATSC transmission.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IATSCLocator)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-iatsclocator
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IATSCLocator extends IDigitalLocator{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IATSCLocator
     * @type {Guid}
     */
    static IID => Guid("{bf8d986f-8c2b-4131-94d7-4d3d9fcc21ef}")

    /**
     * The class identifier for ATSCLocator
     * @type {Guid}
     */
    static CLSID => Guid("{8872ff1b-98fa-4d7a-8d93-c9f1055f85bb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PhysicalChannel", "put_PhysicalChannel", "get_TSID", "put_TSID"]

    /**
     * @type {Integer} 
     */
    PhysicalChannel {
        get => this.get_PhysicalChannel()
        set => this.put_PhysicalChannel(value)
    }

    /**
     * @type {Integer} 
     */
    TSID {
        get => this.get_TSID()
        set => this.put_TSID(value)
    }

    /**
     * The get_PhysicalChannel method retrieves the physical channel.
     * @returns {Integer} Receives the physical channel.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iatsclocator-get_physicalchannel
     */
    get_PhysicalChannel() {
        result := ComCall(22, this, "int*", &PhysicalChannel := 0, "HRESULT")
        return PhysicalChannel
    }

    /**
     * The put_PhysicalChannel method sets the physical channel.
     * @param {Integer} PhysicalChannel The physical channel.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iatsclocator-put_physicalchannel
     */
    put_PhysicalChannel(PhysicalChannel) {
        result := ComCall(23, this, "int", PhysicalChannel, "HRESULT")
        return result
    }

    /**
     * The get_TSID method retrieves the transport stream ID.
     * @returns {Integer} Receives the transport stream ID.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iatsclocator-get_tsid
     */
    get_TSID() {
        result := ComCall(24, this, "int*", &TSID := 0, "HRESULT")
        return TSID
    }

    /**
     * The put_TSID method sets the transport stream ID.
     * @param {Integer} TSID The transport stream ID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iatsclocator-put_tsid
     */
    put_TSID(TSID) {
        result := ComCall(25, this, "int", TSID, "HRESULT")
        return result
    }
}
