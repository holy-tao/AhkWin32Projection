#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the values of scale and bias terms supplied to a DirectML operator. Scale and bias have the effect of applying the function g(x) = x * Scale + Bias.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_scale_bias
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_SCALE_BIAS {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The scale term in g(x) = x * <i>Scale</i> + <i>Bias</i>.
     */
    Scale : Float32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The bias term in g(x) = x * <i>Scale</i> + <i>Bias</i>.
     */
    Bias : Float32

}
