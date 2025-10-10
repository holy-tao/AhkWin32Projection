#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EncoderParameter.ahk

/**
 * An EncoderParameters object is an array of EncoderParameter objects along with a data member that specifies the number of EncoderParameter objects in the array.
 * @remarks
 * 
  * When you create an <b>EncoderParameters</b> object, you must allocate enough memory to hold all of the <a href="https://docs.microsoft.com/previous-versions/ms534434(v=vs.85)">EncoderParameter</a> objects that will eventually be placed in the array. For example, if you want to create an <b>EncoderParameters</b> object that will hold an array of five <b>EncoderParameter</b> objects, you should use code similar to the following:
  * 
  * 
  * ```
  * EncoderParameters* pEncoderParameters = (EncoderParameters*)
  *    malloc(sizeof(EncoderParameters) + 4 * sizeof(EncoderParameter));
  * ```
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusimaging/nl-gdiplusimaging-encoderparameters
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class EncoderParameters extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<EncoderParameter>}
     */
    Parameter{
        get {
            if(!this.HasProp("__ParameterProxyArray"))
                this.__ParameterProxyArray := Win32FixedArray(this.ptr + 8, 1, EncoderParameter, "")
            return this.__ParameterProxyArray
        }
    }
}
