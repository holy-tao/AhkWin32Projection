#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ADS_ATTR_INFO.ahk" { ADS_ATTR_INFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDirectoryObject.ahk" { IDirectoryObject }

/**
 * Used with the ADsPropGetInitInfo function to obtain object data that a display specifier applies to.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/nf-adsprop-adspropgetinitinfo">ADsPropGetInitInfo</a> function allocates memory  for the <b>pwzCN</b> and <b>pWritableAttrs</b> members. This memory is freed by the system after all display specifier objects are destroyed. The reference count for the interface pointer in <b>pDsObj</b> is not incremented by calling <b>ADsPropGetInitInfo</b>, so the interface must not be released by the caller.
 * @see https://learn.microsoft.com/windows/win32/api/adsprop/ns-adsprop-adspropinitparams
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADSPROPINITPARAMS {
    #StructPack 8

    /**
     * The size, in bytes, of the <b>ADSPROPINITPARAMS</b> structure. Set this value before calling <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/nf-adsprop-adspropgetinitinfo">ADsPropGetInitInfo</a>.
     */
    dwSize : UInt32

    /**
     * Reserved.
     */
    dwFlags : UInt32

    /**
     * Contains an <b>HRESULT</b> value that specifies the result of the bind/get operation. If this value does not equal <b>S_OK</b>, then the remaining structure members are not initialized and should be ignored.
     */
    hr : HRESULT

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-idirectoryobject">IDirectoryObject</a> interface that represents the directory object that the display specifier applies to. Do not release this interface.
     */
    pDsObj : IDirectoryObject

    /**
     * Pointer to a null-terminated Unicode string that contains the common name of the directory object.
     */
    pwzCN : PWSTR

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-ads_attr_info">ADS_ATTR_INFO</a> structure that contains attribute data for the directory object.
     */
    pWritableAttrs : ADS_ATTR_INFO.Ptr

}
