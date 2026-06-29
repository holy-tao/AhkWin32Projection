#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UIA_ANNOTATIONTYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_Unknown => 60000

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_SpellingError => 60001

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_GrammarError => 60002

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_Comment => 60003

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_FormulaError => 60004

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_TrackChanges => 60005

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_Header => 60006

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_Footer => 60007

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_Highlighted => 60008

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_Endnote => 60009

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_Footnote => 60010

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_InsertionChange => 60011

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_DeletionChange => 60012

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_MoveChange => 60013

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_FormatChange => 60014

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_UnsyncedChange => 60015

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_EditingLockedChange => 60016

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_ExternalChange => 60017

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_ConflictingChange => 60018

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_Author => 60019

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_AdvancedProofingIssue => 60020

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_DataValidationError => 60021

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_CircularReferenceError => 60022

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_Mathematics => 60023

    /**
     * @type {Integer (Int32)}
     */
    static AnnotationType_Sensitive => 60024
}
