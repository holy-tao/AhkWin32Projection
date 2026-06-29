#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct CorGenericParamAttr {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
