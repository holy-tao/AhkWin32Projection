#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMReaderTypeNegotiation interface provides a single method that can be used to test certain changes to the output properties of a stream.An IWMReaderTypeNegotiation interface exists for every reader object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreadertypenegotiation
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderTypeNegotiation extends IUnknown{
    /**
     * The interface identifier for IWMReaderTypeNegotiation
     * @type {Guid}
     */
    static IID => Guid("{fdbe5592-81a1-41ea-93bd-735cad1adc05}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<IWMOutputMediaProps>} pOutput 
     * @returns {HRESULT} 
     */
    TryOutputProps(dwOutputNum, pOutput) {
        result := ComCall(3, this, "uint", dwOutputNum, "ptr", pOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
