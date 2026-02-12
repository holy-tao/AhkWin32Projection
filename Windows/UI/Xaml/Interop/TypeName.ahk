#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk

/**
 * Substitutes for **System.Type** such that type information reported by other APIs doesn't have a dependency on the common language runtime (CLR). This structure is used as a value by properties such as [UnderlyingType](../windows.ui.xaml.markup/ixamltype_underlyingtype.md) and [Type](../windows.ui.xaml.data/icustomproperty_type.md).
  * 
  * > **.NET**
  * > When programming with .NET, this type is hidden and you should use the [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) type. All Windows Runtime APIs that use a **TypeName** per the raw IDL signatures will instead use [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) values when you use the API with .NET code.
  * 
  * > **[C++/WinRT](/windows/uwp/cpp-and-winrt-apis/index)**
  * > You can use the **winrt::xaml_typename\<T\>()** helper function to create a **TypeName** object. See [winrt::xaml_typename function template](/uwp/cpp-ref-for-winrt/xaml-typename) for more details, and a code example.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.typename
 * @namespace Windows.UI.Xaml.Interop
 * @version WindowsRuntime 1.4
 */
class TypeName extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The name of the type. Depending on the value of *Kind* (see below), *Name* can contain any of the following.
     * 
     * - If *Kind* is set to **TypeKind::Custom**, then the contents of *Name* is unspecified, and language-projection-dependent (in the case of C#, the value is a fully-qualified name).
     * - If *Kind* is set to **TypeKind::Metadata**, then *Name* contains the Windows Runtime class name, such as "Windows.UI.Xaml.Controls.Button".
     * - If *Kind* is set to **TypeKind::Primitive**, then *Name* contains a primitive name, such as "Int32".
     * @type {HSTRING}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := HSTRING(0, this)
            return this.__Name
        }
    }

    /**
     * A [TypeKind](/uwp/api/windows.ui.xaml.interop.typekind) value containing basic guidance regarding the origin of the type.
     * @type {Integer}
     */
    Kind {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
