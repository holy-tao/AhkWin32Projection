#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMMediaProps.ahk

/**
 * The IWMOutputMediaProps interface is used to retrieve the properties of an output stream.An IWMOutputMediaProps object is created by a call to IWMReader::GetOutputFormat or IWMReader::GetOutputProps.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmoutputmediaprops
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMOutputMediaProps extends IWMMediaProps{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMOutputMediaProps
     * @type {Guid}
     */
    static IID => Guid("{96406bd7-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamGroupName", "GetConnectionName"]

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Pointer<Integer>} pcchName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmoutputmediaprops-getstreamgroupname
     */
    GetStreamGroupName(pwszName, pcchName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(6, this, "ptr", pwszName, "ushort*", pcchName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Pointer<Integer>} pcchName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmoutputmediaprops-getconnectionname
     */
    GetConnectionName(pwszName, pcchName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(7, this, "ptr", pwszName, "ushort*", pcchName, "HRESULT")
        return result
    }
}
