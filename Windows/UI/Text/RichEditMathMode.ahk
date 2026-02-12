#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify whether a [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) interprets input as math ([MathML](https://www.w3.org/Math/)) or text.
  * 
  * > [!IMPORTANT]
  * > **Windows 11, version 23H2 and earlier:** the math mode API are part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
 * @remarks
 * Math mode enables users to have input automatically recognized and converted to [MathML](https://www.w3.org/Math/) while being received. For example, "4^2" is converted to "4<sup>2</sup>", and "1/2" is converted to "½".
 * 
 * Math mode might change formatting (fonts), context menus, and other aspects of the input.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richeditmathmode
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class RichEditMathMode extends Win32Enum{

    /**
     * Input is interpreted as text.
     * @type {Integer (Int32)}
     */
    static NoMath => 0

    /**
     * Input is interpreted as math.
     * @type {Integer (Int32)}
     */
    static MathOnly => 1
}
