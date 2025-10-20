#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ILocator.ahk

/**
 * The IAnalogLocator interface provides tuning information for an analog television network.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IAnalogLocator)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ianaloglocator
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IAnalogLocator extends ILocator{
    /**
     * The interface identifier for IAnalogLocator
     * @type {Guid}
     */
    static IID => Guid("{34d1f26b-e339-430d-abce-738cb48984dc}")

    /**
     * The class identifier for AnalogLocator
     * @type {Guid}
     */
    static CLSID => Guid("{49638b91-48ab-48b7-a47a-7d0e75a08ede}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * 
     * @param {Pointer<Int32>} AVS 
     * @returns {HRESULT} 
     */
    get_VideoStandard(AVS) {
        result := ComCall(22, this, "int*", AVS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AVS 
     * @returns {HRESULT} 
     */
    put_VideoStandard(AVS) {
        result := ComCall(23, this, "int", AVS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
