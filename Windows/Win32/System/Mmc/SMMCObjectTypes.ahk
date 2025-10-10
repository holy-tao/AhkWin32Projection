#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SMMCDynamicExtensions structure is introduced in MMC 1.1.
 * @remarks
 * 
  * For a snap-in to support dynamic extension of its items with non-namespace extensions (that is, context menu, toolbar, property sheet, or taskpad extensions), the clipboard format CCF_MMC_DYNAMIC_EXTENSIONS must be handled in the snap-in's <b>IDataObject</b> implementation. For more information, see 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/dynamic-non-namespace-extensions">Dynamic Non-Namespace Extensions</a>.
  * 
  * Be aware that the extension snap-in must be a non-namespace extension and the MMC registry entries for the snap-in to be extended as well as the extension snap-in must be set correctly. For details on setting MMC registry entries for extensions, see 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/registration-requirements-for-extension-snap-ins">Registration Requirements for Extension Snap-ins</a>.
  * 
  * The CCF_MMC_DYNAMIC_EXTENSIONS clipboard format extends only non-namespace extensions. To dynamically add namespace extensions, the snap-in must use the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iconsolenamespace2-addextension">IConsoleNameSpace2::AddExtension</a> method. For more information, see 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/dynamic-namespace-extensions">Dynamic Namespace Extensions</a>.
  * 
  * Just before MMC must use an extensible feature (that is, just before creating and that displays a context menu, property sheet, toolbar, or taskpad), MMC calls <b>IDataObject::GetDataHere</b> on the data object for the selected item and asks for dynamic extensions to add through the CCF_MMC_DYNAMIC_EXTENSIONS clipboard format. Based on CLSIDs passed in the 
  * <b>SMMCDynamicExtensions</b> structure, MMC attempts to add the specified extensions to the extensible feature. If an extension is unavailable or unregistered, MMC skips that extension and continues to the next CLSID passed in the structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mmc/ns-mmc-smmcobjecttypes
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class SMMCObjectTypes extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The count of GUIDs in the array specified by <b>guid</b>.
     * @type {Integer}
     */
    count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of GUIDs that represent the CLSIDs of the snap-ins that you want to extend the item represented by an <b>IDataObject</b> object.
     * @type {Array<Guid>}
     */
    guid{
        get {
            if(!this.HasProp("__guidProxyArray"))
                this.__guidProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__guidProxyArray
        }
    }
}
