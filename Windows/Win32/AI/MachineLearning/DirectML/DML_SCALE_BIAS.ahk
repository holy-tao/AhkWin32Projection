#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the values of scale and bias terms supplied to a DirectML operator. Scale and bias have the effect of applying the function g(x) = x * Scale + Bias.
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_scale_bias
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_SCALE_BIAS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The scale term in g(x) = x * <i>Scale</i> + <i>Bias</i>.
     * @type {Float}
     */
    Scale {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The bias term in g(x) = x * <i>Scale</i> + <i>Bias</i>.
     * @type {Float}
     */
    Bias {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}
