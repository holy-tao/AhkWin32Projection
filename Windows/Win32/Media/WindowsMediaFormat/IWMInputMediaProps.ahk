#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMMediaProps.ahk

/**
 * The IWMInputMediaProps interface is used to retrieve the properties of digital media that will be passed to the writer.An input media properties object is created by a call to either the IWMWriter::GetInputProps or IWMWriter::GetInputFormat method.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwminputmediaprops
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMInputMediaProps extends IWMMediaProps{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMInputMediaProps
     * @type {Guid}
     */
    static IID => Guid("{96406bd5-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConnectionName", "GetGroupName"]

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Pointer<Integer>} pcchName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwminputmediaprops-getconnectionname
     */
    GetConnectionName(pwszName, pcchName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(6, this, "ptr", pwszName, "ushort*", pcchName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Pointer<Integer>} pcchName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwminputmediaprops-getgroupname
     */
    GetGroupName(pwszName, pcchName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(7, this, "ptr", pwszName, "ushort*", pcchName, "HRESULT")
        return result
    }
}
