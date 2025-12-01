#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the way a function is invoked.
 * @remarks
 * In C, value assignment is written as *pobj1 = *pobj2, while reference assignment is written as pobj1 = pobj2. Other languages have other syntactic conventions. A property or data member can support only a value assignment, a reference assignment, or both. The INVOKEKIND enumeration constants are the same constants that are passed to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-idispatch-invoke">IDispatch::Invoke</a> to specify the way in which a function is invoked.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ne-oaidl-invokekind
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class INVOKEKIND extends Win32Enum{

    /**
     * The member is called using a normal function invocation syntax.
     * @type {Integer (Int32)}
     */
    static INVOKE_FUNC => 1

    /**
     * The function is invoked using a normal property-access syntax.
     * @type {Integer (Int32)}
     */
    static INVOKE_PROPERTYGET => 2

    /**
     * The function is invoked using a property value assignment syntax. Syntactically, a typical programming language might represent changing a property in the same way as assignment. For example: object.property : = value.
     * @type {Integer (Int32)}
     */
    static INVOKE_PROPERTYPUT => 4

    /**
     * The function is invoked using a property reference assignment syntax.
     * @type {Integer (Int32)}
     */
    static INVOKE_PROPERTYPUTREF => 8
}
