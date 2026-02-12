#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the programming construct to which an attribute applies.
  * 
  * 
  * 
  * > **.NET**
  * > This type appears as [System.AttributeTargets](/dotnet/api/system.attributetargets?view=dotnet-uwp-10.0&preserve-view=true).
 * @remarks
 * When programming with .NET, this type is hidden and developers should use [System.AttributeTargets](/dotnet/api/system.attributetargets?view=dotnet-uwp-10.0&preserve-view=true).
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.metadata.attributetargets
 * @namespace Windows.Foundation.Metadata
 * @version WindowsRuntime 1.4
 */
class AttributeTargets extends Win32BitflagEnum{

    /**
     * The attribute applies to all programming constructs.
     * @type {Integer (UInt32)}
     */
    static All => 4294967295

    /**
     * The attribute applies to a delegate.
     * @type {Integer (UInt32)}
     */
    static Delegate => 1

    /**
     * The attribute applies to an enumeration.
     * @type {Integer (UInt32)}
     */
    static Enum => 2

    /**
     * The attribute applies to an event.
     * @type {Integer (UInt32)}
     */
    static Event => 4

    /**
     * The attribute applies to a field.
     * @type {Integer (UInt32)}
     */
    static Field => 8

    /**
     * The attribute applies to an interface.
     * @type {Integer (UInt32)}
     */
    static Interface => 16

    /**
     * The attribute applies to a method.
     * @type {Integer (UInt32)}
     */
    static Method => 64

    /**
     * The attribute applies to a parameter.
     * @type {Integer (UInt32)}
     */
    static Parameter => 128

    /**
     * The attribute applies to a property.
     * @type {Integer (UInt32)}
     */
    static Property => 256

    /**
     * The attribute applies to a runtime class.
     * @type {Integer (UInt32)}
     */
    static RuntimeClass => 512

    /**
     * The attribute applies to a struct.
     * @type {Integer (UInt32)}
     */
    static Struct => 1024

    /**
     * The attribute applies to an implementation of an interface.
     * @type {Integer (UInt32)}
     */
    static InterfaceImpl => 2048

    /**
     * The attribute applies to an API contract.
     * @type {Integer (UInt32)}
     */
    static ApiContract => 8192
}
