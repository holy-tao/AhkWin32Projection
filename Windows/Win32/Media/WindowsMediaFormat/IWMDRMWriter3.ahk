#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDRMWriter2.ahk

/**
 * The IWMDRMWriter3 interface enables writing of encrypted stream samples for importing protected content.An IWMDRMWriter3 interface exists for every writer object when linking to WMStubDRM.lib.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmdrmwriter3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMDRMWriter3 extends IWMDRMWriter2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDRMWriter3
     * @type {Guid}
     */
    static IID => Guid("{a7184082-a4aa-4dde-ac9c-e75dbd1117ce}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProtectStreamSamples"]

    /**
     * The SetProtectStreamSamples method configures the writer to accept encrypted stream samples. This method is used as part of the process of importing protected content from a third party content protection scheme (CPS) into Windows Media DRM.
     * @param {Pointer<WMDRM_IMPORT_INIT_STRUCT>} pImportInitStruct Address of a <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wmdrm_import_init_struct">WMDRM_IMPORT_INIT_STRUCT</a> structure containing initialization information needed to import protected content.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_DRM_RIV_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An updated content revocation list is needed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdrmwriter3-setprotectstreamsamples
     */
    SetProtectStreamSamples(pImportInitStruct) {
        result := ComCall(8, this, "ptr", pImportInitStruct, "HRESULT")
        return result
    }
}
