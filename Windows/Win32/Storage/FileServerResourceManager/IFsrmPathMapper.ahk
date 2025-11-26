#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used to retrieve the network share paths that are mapped to a local path.
 * @remarks
 * 
 * To create this object from a script, use the program identifier, "Fsrm.FsrmPathMapper".
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrm/nn-fsrm-ifsrmpathmapper
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmPathMapper extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmPathMapper
     * @type {Guid}
     */
    static IID => Guid("{6f4dbfff-6920-4821-a6c3-b7e94c1fd60c}")

    /**
     * The class identifier for FsrmPathMapper
     * @type {Guid}
     */
    static CLSID => Guid("{f3be42bd-8ac2-409e-bbd8-faf9b6b41feb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSharePathsForLocalPath"]

    /**
     * Retrieves a list of network shares that point to the specified local path.
     * @param {BSTR} localPath The local path. The string is limited to 260 characters.
     * @returns {Pointer<SAFEARRAY>} A <b>SAFEARRAY</b> of <b>VARIANT</b>s. Each 
     *       <b>VARIANT</b> contains a network share path that points to the local path. The variant 
     *       type is <b>VT_BSTR</b>. Use the <b>bstrVal</b> member to access the share 
     *       path.
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmpathmapper-getsharepathsforlocalpath
     */
    GetSharePathsForLocalPath(localPath) {
        localPath := localPath is String ? BSTR.Alloc(localPath).Value : localPath

        result := ComCall(7, this, "ptr", localPath, "ptr*", &sharePaths := 0, "HRESULT")
        return sharePaths
    }
}
