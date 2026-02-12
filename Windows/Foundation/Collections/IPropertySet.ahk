#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a collection of key-value pairs, correlating several other collection interfaces.
 * @remarks
 * This interface is unusual in that it doesn't define any new members. Instead, it correlates three other collection interfaces such that they share the same type parameter constraints:
 * + [IIterable](iiterable_1.md) (constraint [IKeyValuePair](ikeyvaluepair_2.md), with inner constraint of **String**, **Object**)
 * + [IMap](imap_2.md) (constraint **String**, **Object**)
 * + [IObservableMap](iobservablemap_2.md) (constraint **String**, **Object**)
 * 
 * If you cast an object to IPropertySet (which isn't a generic) you can then use the combined methods of these three interfaces based on using **String** for key, **Object** for value. For a practical implementation, Windows Runtime uses the [PropertySet](propertyset.md) class. See the documentation for various members of [PropertySet](propertyset.md) to learn how to use those methods once you cast as IPropertySet.
 * 
 * In many cases where a Windows Runtime API uses a [PropertySet](propertyset.md) as a value, it's actually shown as IPropertySet in the signatures. [PropertySet](propertyset.md) can be considered the practical implementation of IPropertySet that's ready for use by app code. JavaScript code can treat any IPropertySet value as if it implemented the [PropertySet](propertyset.md) prototypes. Usage by type is the main scenario for IPropertySet; actually implementing the interface in your app code is less common.
 * 
 * IPropertySet is also implemented by the [ValueSet](valueset.md) class. [ValueSet](valueset.md) is the value type of several **ContinuationData** properties, which enable restoring state when apps resume after calling an **AndContinue** method that might deactivate the app. [ValueSet](valueset.md) and all the **ContinuationData** properties and **AndContinue** methods are Windows Phone only APIs because it's only Windows Phone that has this behavior. For more info, see [How to continue your Windows Phone Store app after calling an AndContinue method](/previous-versions/windows/apps/dn631755(v=win.10)). The difference between [ValueSet](valueset.md) and [PropertySet](propertyset.md) is that the [ValueSet](valueset.md) implementation of methods like [Insert](valueset_insert_2123640444.md) enforces that its property values are value types.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.ipropertyset
 * @namespace Windows.Foundation.Collections
 * @version WindowsRuntime 1.4
 */
class IPropertySet extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertySet
     * @type {Guid}
     */
    static IID => Guid("{8a43ed9f-f4e6-4421-acf9-1dab2986820c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
