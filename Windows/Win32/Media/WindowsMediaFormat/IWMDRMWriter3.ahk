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
     * 
     * @param {Pointer<WMDRM_IMPORT_INIT_STRUCT>} pImportInitStruct 
     * @returns {HRESULT} 
     */
    SetProtectStreamSamples(pImportInitStruct) {
        result := ComCall(8, this, "ptr", pImportInitStruct, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
