#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Enumerates the type of the value being assigned to an FSRM property in a property condition.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmpropertyvaluetype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct FsrmPropertyValueType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The type assigned to the property value is not defined.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyValueType_Undefined => 0

    /**
     * The type assigned to the property value is one or more literal values.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyValueType_Literal => 1

    /**
     * The type assigned to the property value is a date expression containing a date variable and an optional 
     *       date offset.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyValueType_DateOffset => 2
}
