#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the ADsPropGetInitInfo function to obtain object data that a display specifier applies to.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/nf-adsprop-adspropgetinitinfo">ADsPropGetInitInfo</a> function allocates memory  for the <b>pwzCN</b> and <b>pWritableAttrs</b> members. This memory is freed by the system after all display specifier objects are destroyed. The reference count for the interface pointer in <b>pDsObj</b> is not incremented by calling <b>ADsPropGetInitInfo</b>, so the interface must not be released by the caller.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//adsprop/ns-adsprop-adspropinitparams
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADSPROPINITPARAMS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The size, in bytes, of the <b>ADSPROPINITPARAMS</b> structure. Set this value before calling <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/nf-adsprop-adspropgetinitinfo">ADsPropGetInitInfo</a>.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains an <b>HRESULT</b> value that specifies the result of the bind/get operation. If this value does not equal <b>S_OK</b>, then the remaining structure members are not initialized and should be ignored.
     * @type {HRESULT}
     */
    hr {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-idirectoryobject">IDirectoryObject</a> interface that represents the directory object that the display specifier applies to. Do not release this interface.
     * @type {Pointer<IDirectoryObject>}
     */
    pDsObj {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the common name of the directory object.
     * @type {Pointer<Char>}
     */
    pwzCN {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-ads_attr_info">ADS_ATTR_INFO</a> structure that contains attribute data for the directory object.
     * @type {Pointer<ADS_ATTR_INFO>}
     */
    pWritableAttrs {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
