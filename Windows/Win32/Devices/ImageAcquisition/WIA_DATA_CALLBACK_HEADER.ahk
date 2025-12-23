#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WIA_DATA_CALLBACK_HEADER is transmitted to an application during a series of calls by the Windows Image Acquisition (WIA) run-time system to the IWiaDataCallback::BandedDataCallback method.
 * @see https://learn.microsoft.com/windows/win32/api/wia_xp/ns-wia_xp-wia_data_callback_header
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class WIA_DATA_CALLBACK_HEADER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>LONG</b>
     * 
     * Must contain the size of this structure in bytes. Should be initialized to <b>sizeof(WIA_DATA_CALLBACK_HEADER)</b>.
     * @type {Integer}
     */
    lSize {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>GUID</b>
     * 
     * Indicates the image clipboard format. For a list of clipboard formats, see <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setclipboarddata">SetClipboardData</a> Function. This parameter is queried during a callback to the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiadatacallback-bandeddatacallback">IWiaDataCallback::BandedDataCallback</a> method with the <i>lMessage</i> parameter set to IT_MSG_DATA_HEADER.
     * @type {Pointer<Guid>}
     */
    guidFormatID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>LONG</b>
     * 
     * Specifies the size in bytes of the buffer needed for a complete data transfer. This value can be zero, which indicates that the total image size is unknown. (when using compressed data formats, for example). In this case, the application should dynamically increase the size of its buffer. For more information, see <a href="https://docs.microsoft.com/windows/desktop/wia/-wia-wiaitempropcommonitem">Common WIA Item Property Constants</a> in WIA_IPA_ITEM_SIZE.
     * @type {Integer}
     */
    lBufferSize {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b>LONG</b>
     * 
     * Specifies the page count. Indicates the number of callbacks to the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiadatacallback-bandeddatacallback">IWiaDataCallback::BandedDataCallback</a> method with the <i>lMessage</i>  parameter set to IT_MSG_NEW_PAGE.
     * @type {Integer}
     */
    lPageCount {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
