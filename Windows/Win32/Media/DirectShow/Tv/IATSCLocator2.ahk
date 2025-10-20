#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IATSCLocator.ahk

/**
 * The IATASCLocator2 interface enables the network provider to determine the physical channel, transport stream ID, and program number of an ATSC transmission.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IATSCLocator2)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-iatsclocator2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IATSCLocator2 extends IATSCLocator{
    /**
     * The interface identifier for IATSCLocator2
     * @type {Guid}
     */
    static IID => Guid("{612aa885-66cf-4090-ba0a-566f5312e4ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * 
     * @param {Pointer<Int32>} ProgramNumber 
     * @returns {HRESULT} 
     */
    get_ProgramNumber(ProgramNumber) {
        result := ComCall(26, this, "int*", ProgramNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ProgramNumber 
     * @returns {HRESULT} 
     */
    put_ProgramNumber(ProgramNumber) {
        result := ComCall(27, this, "int", ProgramNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
