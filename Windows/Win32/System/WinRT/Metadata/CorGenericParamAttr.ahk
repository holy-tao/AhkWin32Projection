#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorGenericParamAttr extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static gpVarianceMask => 3

    /**
     * @type {Integer (Int32)}
     */
    static gpNonVariant => 0

    /**
     * @type {Integer (Int32)}
     */
    static gpCovariant => 1

    /**
     * @type {Integer (Int32)}
     */
    static gpContravariant => 2

    /**
     * @type {Integer (Int32)}
     */
    static gpSpecialConstraintMask => 28

    /**
     * @type {Integer (Int32)}
     */
    static gpNoSpecialConstraint => 0

    /**
     * @type {Integer (Int32)}
     */
    static gpReferenceTypeConstraint => 4

    /**
     * @type {Integer (Int32)}
     */
    static gpNotNullableValueTypeConstraint => 8

    /**
     * @type {Integer (Int32)}
     */
    static gpDefaultConstructorConstraint => 16
}
