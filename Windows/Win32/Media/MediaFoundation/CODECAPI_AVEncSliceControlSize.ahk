#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the size of the slice in units of megabyte (MB), bits, or MB row.
 * @remarks
 * **H.264/AVC encoders:**
 * 
 * The meaning of the value of CODECAPI\_AVEncSliceControlSize is controlled by the [CODECAPI\_AVEncSliceControlMode](codecapi-avencslicecontrolmode.md) property. The following table illustrates how the CODECAPI\_AVEncSliceControlSize and CODECAPI\_AVEncSliceControlMode properties control the size and number of slices in a frame.
 * 
 * 
 * 
 * | CODECAPI\_AVEncSliceControlMode setting | Meaning of value                                                                                                                                                                                                                                                                                                                                                                                           |
 * |-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | 0                                       | This is an integer that indicates the size of each slice in the frame in units of macroblocks. <br/> The encoder should reject the setting when the value is greater than the number of macroblocks in the frame.<br/>                                                                                                                                                                         |
 * | 1                                       | This is an integer that indicates the size of each slice in the frame in units of bits. <br/> The encoder should start a new slice at the macroblock that causes the number of bits in the slice to exceed this value (so the size of each slice will always be less than or equal than this value). This means that the last slice size could be significantly smaller than this value. <br/> |
 * | 2                                       | This is an integer that indicates the size of each slice in the frame in units of macroblock rows. <br/> The encoder should reject the setting when the value is greater than the number of macroblock rows in the frame.<br/>                                                                                                                                                                 |
 * 
 * 
 * 
 *  
 * 
 * If the application does not set a value for [CODECAPI\_AVEncSliceControlMode](codecapi-avencslicecontrolmode.md), the encoder should return an error.
 * 
 * The recommended default is to have a single slice for whole frame.
 * 
 * Some encoders might encode slices in parallel and so performance could be affected depending on the slice control settings. For example, encoding a frame as a single slice might be slower than if the frame was encoded as multiple slices.
 * 
 * The slice control settings are dynamic and can be changed during the encoding session.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avencslicecontrolsize
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class CODECAPI_AVEncSliceControlSize extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
