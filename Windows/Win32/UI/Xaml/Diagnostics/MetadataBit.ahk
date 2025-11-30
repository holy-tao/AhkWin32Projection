#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that are used to define the PropertyChainValue returned from XAML Diagnostics.
 * @see https://docs.microsoft.com/windows/win32/api//xamlom/ne-xamlom-metadatabit
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 * @version v4.0.30319
 */
class MetadataBit extends Win32Enum{

    /**
     * No special bits are set.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The value represents a string representation of an <b>InstanceHandle</b>.
     * @type {Integer (Int32)}
     */
    static IsValueHandle => 1

    /**
     * The property is read only and cannot be set locally.
     * @type {Integer (Int32)}
     */
    static IsPropertyReadOnly => 2

    /**
     * The value represents a collection object. (When set, <b>IsValueHandle</b> is also set.)
     * @type {Integer (Int32)}
     */
    static IsValueCollection => 4

    /**
     * The value represents a read only collection.
     * @type {Integer (Int32)}
     */
    static IsValueCollectionReadOnly => 8

    /**
     * The value represents the evaluated value of a binding expression.
     * @type {Integer (Int32)}
     */
    static IsValueBindingExpression => 16

    /**
     * The value is <b>null</b>. (Introduced in Windows 10, version 1607.)
     * @type {Integer (Int32)}
     */
    static IsValueNull => 32

    /**
     * The value represents a string representation of an <b>InstanceHandle</b> and an evaluated value. (Introduced in Windows 10, version 1607.)
     * @type {Integer (Int32)}
     */
    static IsValueHandleAndEvaluatedValue => 64
}
