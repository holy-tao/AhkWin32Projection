#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the parameter set used by a raw codec.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicrawparameterset
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICRawParameterSet extends Win32Enum{

    /**
     * An as shot parameter set.
     * @type {Integer (Int32)}
     */
    static WICAsShotParameterSet => 1

    /**
     * A user adjusted parameter set.
     * @type {Integer (Int32)}
     */
    static WICUserAdjustedParameterSet => 2

    /**
     * A codec adjusted parameter set.
     * @type {Integer (Int32)}
     */
    static WICAutoAdjustedParameterSet => 3
}
