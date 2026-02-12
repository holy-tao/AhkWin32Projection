#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides basic guidance about the origin of a type. Used as a value by [TypeName](typename.md).
 * @remarks
 * This enumeration is not relevant to type system information as reported to .NET code. Any value that reports type information from a Windows Runtime  API being called by C# or Microsoft Visual Basic code is projected to [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.typekind
 * @namespace Windows.UI.Xaml.Interop
 * @version WindowsRuntime 1.4
 */
class TypeKind extends Win32Enum{

    /**
     * The type is a language-level primitive.
     * @type {Integer (Int32)}
     */
    static Primitive => 0

    /**
     * The type is declared through WinMD (Windows Runtime metadata).
     * @type {Integer (Int32)}
     */
    static Metadata => 1

    /**
     * The type is a custom type declared by means other than WinMD.
     * @type {Integer (Int32)}
     */
    static Custom => 2
}
