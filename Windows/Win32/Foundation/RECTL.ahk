#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\Graphics\Gdi\Apis.ahk
#Include .\POINT.ahk

/**
 * The RECTL structure defines a rectangle by the coordinates of its upper-left and lower-right corners.
 * @remarks
 * 
  * The RECTL structure is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//windef/ns-windef-rectl
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class RECTL extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Specifies the <i>x</i>-coordinate of the upper-left corner of the rectangle.
     * @type {Integer}
     */
    left {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies the <i>y</i>-coordinate of the upper-left corner of the rectangle.
     * @type {Integer}
     */
    top {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Specifies the <i>x</i>-coordinate of the lower-right corner of the rectangle.
     * @type {Integer}
     */
    right {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Specifies the <i>y</i>-coordinate of the lower-right corner of the rectangle.
     * @type {Integer}
     */
    bottom {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    height => this.bottom - this.top
    
    width => this.right - this.left
    
    area => this.width * this.height
    
    isEmpty => Gdi.IsRectEmpty(this)
    
    /**
     * Calculates the intersection of two source rectangles and returns it as a
     * new rectangle. If the rectangles do not intersect, the resulting rectangle
     * is empty
     *
     * @param {RECT | RECTL} other rectangle to intersect with this one
     * @returns {RECTL} The intersection between this rectangle and `other`
     */
    Intersect(other) {
        intersection := RECTL()
        Gdi.IntersectRect(intersection, this, other)
        return intersection
    }
    
    /**
     * Creates the union of two rectangles. The union is the smallest rectangle that 
     * contains both source rectangles.
     *
     * @param {RECT | RECTL} other rectangle to union this one with
     * @returns {RECTL} the union between this rectangle and `other`
     */
    Union(other) {
        union := RECTL()
        Gdi.UnionRect(union, this, other)
        return union
    }
    
    /**
     * Determines the coordinates of a rectangle formed by subtracting 
     * one rectangle from this one
     *
     * @param {RECT | RECTL} other rectangle to subtract from this one
     * @returns {RECTL} the result of subtracting `other` from this
     */
    Subtract(other) {
        diff := RECTL()
        Gdi.SubtractRect(diff, this, other)
        return diff
    }
    
    /**
     * Determines whether the this rectangle is equal to another
     * 
     * @param {RECT | RECTL} other rectangle to compare this one to
     * @returns {Boolean} a nonzero value of the rectangles are equal, 0 if they aren't
     */
    Equals(other) {
        return Gdi.EqualRect(this, other)
    }
    
    /**
     * Moves the rectangle by the specified offsets
     *
     * @param {Integer} dx the amount to shift the rectangle horizontally
     * @param {Integer} dy the amount to shift the rectangle vertically
     */
    Offset(dx := 0, dy := 0) {
        Gdi.OffsetRect(this, dx, dy)
    }
    
    /**
     * Increases or decreases the width and height of the rectangle
     *
     * @param {Integer} dx the amount to infalte or deflate horizontally
     * @param {Integer} dy the amount to infalte or deflate vertically
     */
    Inflate(dx := 0, dy := 0) {
        Gdi.InflateRect(this, dx, dy)
    }
    
    /**
     * Check whether a point lies inside the rectange. In one-parameter mode,
     * interperets `ptOrXCoord` as a pointer to a `POINT` or equivalent struct;
     * in two-parameter mode, constructs a `POINT` using the provided values.
     *
     * @param {POINT | Integer} ptOrXCoord In one-parameter mode, a pointer to a
     *      POINT or equivalent structure. In two-parameter mode, the x coordinate
     *      of the point to check
     * @param {Integer} yCoord In two-parameter mode, the y coordinate of the point
     *      to check
     * @returns {Boolean} 1 if the point is inside the rectangle, 0 if it isn not
     */
    HitTest(ptOrXCoord, yCoord?){
        if(IsSet(yCoord)){
            pt := POINT({x: Integer(ptOrXCoord), y: Integer(yCoord)})
        }
        else{
            pt := ptOrXCoord
        }
    
        return Gdi.PtInRect(this, pt.Value)
    }
    
    ToString(){
        return Format("({1}, {2}) - ({3}, {4})",
            this.left, this.top, this.right, this.bottom
        )
    }
}
