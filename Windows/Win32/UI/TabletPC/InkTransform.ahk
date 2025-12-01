#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a 3x3 matrix that, in turn, represents an affine transformation.
 * @remarks
 * This object can be instantiated by calling the [**CoCreateInstance**](/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance) method in C++.
 * 
 * The object stores only six of the nine numbers in a 3x3 matrix because all 3x3 matrices that represent affine transformations have the same third column (0, 0, 1). This object in turn is used to describe transformation operations such as moving, shearing, scaling, or rotating in an [**InkRenderer**](inkrenderer-class.md) object, [**IInkStrokeDisp**](/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp) object, or [InkStrokes](/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)) collection.
 * 
 * > [!Note]  
 * > The **InkTransform** object correlates to the [**XFORM**](/windows/win32/api/wingdi/ns-wingdi-xform) structure.
 * @see https://learn.microsoft.com/windows/win32/tablet/inktransform-class
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkTransform extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
