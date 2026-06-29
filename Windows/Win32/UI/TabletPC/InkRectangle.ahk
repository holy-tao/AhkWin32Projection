#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents access to a rectangle.
 * @remarks
 * > [!Note]  
 * > A point is within an **InkRectangle** if it lies on the [**Left**](/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_left) or [**Top**](/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_top) side or is within all four sides. A point on the [**Right**](/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_right) or [**Bottom**](/windows/desktop/api/msinkaut/nf-msinkaut-iinkrectangle-get_bottom) side is considered outside the rectangle.
 * 
 *  
 * 
 * This object can be instantiated by calling the [**CoCreateInstance**](/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance) method.
 * 
 * > [!Note]  
 * > An **InkRectangle** cannot be used if it is larger than LONG\_MAX (2^31 - 1) in either dimension.
 * @see https://learn.microsoft.com/windows/win32/tablet/inkrectangle-class
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct InkRectangle {
    #StructPack 1

}
