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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConvertFile", "GetErrorURL"]

    /**
     * The ConvertFile method is implemented by a conversion plug-in and called by Windows Media Player to enable a conversion plug-in to convert a digital media file into ASF.
     * @param {BSTR} bstrInputFile <b>BSTR</b> containing the path to the file to be converted.
     * @param {BSTR} bstrDestinationFolder <b>BSTR</b> containing that path to the folder where the converted file must be copied.
     * @param {Pointer<BSTR>} pbstrOutputFile Pointer to a <b>BSTR</b> that receives the path to the converted file.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. The following table lists recommended return codes.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_WMP_CONVERT_FILE_FAILED</b></dt>
     * <dt>0xC00D1158</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified failure while converting the file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_WMP_CONVERT_NO_RIGHTS_ERRORURL</b></dt>
     * <dt>0xC00D1159</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The license prohibits file conversion. <b>IWMPConvert::GetErrorURL</b> must return the URL of the webpage that describes the issue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_WMP_CONVERT_NO_RIGHTS_NOERRORURL</b></dt>
     * <dt>0xC00D115A</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The license prohibits file conversion. There is no error URL available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_WMP_CONVERT_FILE_CORRUPT</b></dt>
     * <dt>0xC00D115B</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified file is corrupted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_WMP_CONVERT_PLUGIN_UNAVAILABLE_ERRORURL</b></dt>
     * <dt>0xC00D115C</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is an unspecified problem with the plug-in. <b>IWMPConvert::GetErrorURL</b> must return the URL of the webpage where the user can reinstall the plug-in.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_WMP_CONVERT_PLUGIN_UNAVAILABLE_NOERRORURL</b></dt>
     * <dt>0xC00D115D</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is an unspecified problem with the plug-in. There is no error URL available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_WMP_CONVERT_PLUGIN_UNKNOWN_FILE_OWNER</b></dt>
     * <dt>0xC00D115E</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This conversion plug-in is not the correct one to convert the current file.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmpservices/nf-wmpservices-iwmpconvert-convertfile
     */
    ConvertFile(bstrInputFile, bstrDestinationFolder, pbstrOutputFile) {
        bstrInputFile := bstrInputFile is String ? BSTR.Alloc(bstrInputFile).Value : bstrInputFile
        bstrDestinationFolder := bstrDestinationFolder is String ? BSTR.Alloc(bstrDestinationFolder).Value : bstrDestinationFolder

        result := ComCall(3, this, "ptr", bstrInputFile, "ptr", bstrDestinationFolder, "ptr", pbstrOutputFile, "HRESULT")
        return result
    }

    /**
     * The GetErrorURL method is implemented by a conversion plug-in and called by Windows Media Player to retrieve the URL of a webpage that displays information to help the user correct the condition that caused an error.
     * @param {Pointer<BSTR>} pbstrURL Pointer to a <b>BSTR</b> that receives the URL of the webpage that displays the error information.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wmpservices/nf-wmpservices-iwmpconvert-geterrorurl
     */
    GetErrorURL(pbstrURL) {
        result := ComCall(4, this, "ptr", pbstrURL, "HRESULT")
        return result
    }
}
