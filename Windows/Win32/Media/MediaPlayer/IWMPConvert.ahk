#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPConvert interface provides methods to enable Windows Media Player conversion plug-ins to convert digital media files that are created using technologies not provided by Microsoft, into Advanced Systems Format (ASF).
 * @remarks
 * 
  * These methods are implemented by a conversion plug-in and called by Windows Media Player.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wmpservices/nn-wmpservices-iwmpconvert
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPConvert extends IUnknown{
    /**
     * The interface identifier for IWMPConvert
     * @type {Guid}
     */
    static IID => Guid("{d683162f-57d4-4108-8373-4a9676d1c2e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BSTR} bstrInputFile 
     * @param {BSTR} bstrDestinationFolder 
     * @param {Pointer<BSTR>} pbstrOutputFile 
     * @returns {HRESULT} 
     */
    ConvertFile(bstrInputFile, bstrDestinationFolder, pbstrOutputFile) {
        bstrInputFile := bstrInputFile is String ? BSTR.Alloc(bstrInputFile).Value : bstrInputFile
        bstrDestinationFolder := bstrDestinationFolder is String ? BSTR.Alloc(bstrDestinationFolder).Value : bstrDestinationFolder

        result := ComCall(3, this, "ptr", bstrInputFile, "ptr", bstrDestinationFolder, "ptr", pbstrOutputFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrURL 
     * @returns {HRESULT} 
     */
    GetErrorURL(pbstrURL) {
        result := ComCall(4, this, "ptr", pbstrURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
