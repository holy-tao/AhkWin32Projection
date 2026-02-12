#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The types of decode lengths that barcode symbologies can support.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologydecodelengthkind
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class BarcodeSymbologyDecodeLengthKind extends Win32Enum{

    /**
     * Decode lengths of any number.
     * @type {Integer (Int32)}
     */
    static AnyLength => 0

    /**
     * Decode lengths of either [DecodeLength1](barcodesymbologyattributes_decodelength1.md) or [DecodeLength2](barcodesymbologyattributes_decodelength2.md) single-byte characters.
     * @type {Integer (Int32)}
     */
    static Discrete => 1

    /**
     * Decode lengths between [DecodeLength1](barcodesymbologyattributes_decodelength1.md) and [DecodeLength2](barcodesymbologyattributes_decodelength2.md) single-byte characters. The order of [DecodeLength1](barcodesymbologyattributes_decodelength1.md) and [DecodeLength2](barcodesymbologyattributes_decodelength2.md) do not matter (either can be higher or lower than the other).
     * @type {Integer (Int32)}
     */
    static Range => 2
}
