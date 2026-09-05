#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the parameter set used by a raw codec.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicrawparameterset
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICRawParameterSet extends Win32Enum {

    /**
     * An as shot parameter set.
     * Native name: WICAsShotParameterSet
     * @type {Integer (Int32)}
     */
    static AsShotParameterSet => 1

    /**
     * A user adjusted parameter set.
     * Native name: WICUserAdjustedParameterSet
     * @type {Integer (Int32)}
     */
    static UserAdjustedParameterSet => 2

    /**
     * A codec adjusted parameter set.
     * Native name: WICAutoAdjustedParameterSet
     * @type {Integer (Int32)}
     */
    static AutoAdjustedParameterSet => 3
}
