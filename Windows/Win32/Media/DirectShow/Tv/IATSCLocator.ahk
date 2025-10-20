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
     * 
     * @param {Pointer<Int32>} PhysicalChannel 
     * @returns {HRESULT} 
     */
    get_PhysicalChannel(PhysicalChannel) {
        result := ComCall(22, this, "int*", PhysicalChannel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PhysicalChannel 
     * @returns {HRESULT} 
     */
    put_PhysicalChannel(PhysicalChannel) {
        result := ComCall(23, this, "int", PhysicalChannel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} TSID 
     * @returns {HRESULT} 
     */
    get_TSID(TSID) {
        result := ComCall(24, this, "int*", TSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} TSID 
     * @returns {HRESULT} 
     */
    put_TSID(TSID) {
        result := ComCall(25, this, "int", TSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
