#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMReaderAccelerator interface is implemented on the reader object only when it is in decoding mode. It is called by a player or a player source filter to obtain interfaces from the decoder DMO.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreaderaccelerator
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderAccelerator extends IUnknown{
    /**
     * The interface identifier for IWMReaderAccelerator
     * @type {Guid}
     */
    static IID => Guid("{bddc4d08-944d-4d52-a612-46c3fda07dd4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvCodecInterface 
     * @returns {HRESULT} 
     */
    GetCodecInterface(dwOutputNum, riid, ppvCodecInterface) {
        result := ComCall(3, this, "uint", dwOutputNum, "ptr", riid, "ptr", ppvCodecInterface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<WM_MEDIA_TYPE>} pSubtype 
     * @returns {HRESULT} 
     */
    Notify(dwOutputNum, pSubtype) {
        result := ComCall(4, this, "uint", dwOutputNum, "ptr", pSubtype, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
