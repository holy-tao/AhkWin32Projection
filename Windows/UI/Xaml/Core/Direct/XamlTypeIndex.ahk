#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Enum that lists all the supported types in [XamlDirect](windows_ui_xaml_core_direct.md). 
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Core.Direct.XamlTypeIndex](/windows/winui/api/microsoft.ui.xaml.core.direct.xamltypeindex) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamltypeindex
 * @namespace Windows.UI.Xaml.Core.Direct
 * @version WindowsRuntime 1.4
 */
class XamlTypeIndex extends Win32Enum{

    /**
     * The [AutoSuggestBoxSuggestionChosenEventArgs](../windows.ui.xaml.controls/autosuggestboxsuggestionchoseneventargs.md) type.
     * @type {Integer (Int32)}
     */
    static AutoSuggestBoxSuggestionChosenEventArgs => 34

    /**
     * The [AutoSuggestBoxTextChangedEventArgs](../windows.ui.xaml.controls/autosuggestboxtextchangedeventargs.md) type.
     * @type {Integer (Int32)}
     */
    static AutoSuggestBoxTextChangedEventArgs => 35

    /**
     * The [CollectionViewSource](../windows.ui.xaml.data/collectionviewsource.md) type.
     * @type {Integer (Int32)}
     */
    static CollectionViewSource => 41

    /**
     * The [ColumnDefinition](../windows.ui.xaml.controls/columndefinition.md) type.
     * @type {Integer (Int32)}
     */
    static ColumnDefinition => 44

    /**
     * The [GradientStop](../windows.ui.xaml.media/gradientstop.md) type.
     * @type {Integer (Int32)}
     */
    static GradientStop => 64

    /**
     * The [InputScope](../windows.ui.xaml.input/inputscope.md) type.
     * @type {Integer (Int32)}
     */
    static InputScope => 74

    /**
     * The [InputScopeName](../windows.ui.xaml.input/inputscopename.md) type.
     * @type {Integer (Int32)}
     */
    static InputScopeName => 75

    /**
     * The [KeySpline](../windows.ui.xaml.media.animation/keyspline.md) type.
     * @type {Integer (Int32)}
     */
    static KeySpline => 78

    /**
     * The [PathFigure](../windows.ui.xaml.media/pathfigure.md) type.
     * @type {Integer (Int32)}
     */
    static PathFigure => 93

    /**
     * The [PrintDocument](../windows.ui.xaml.printing/printdocument.md) type.
     * @type {Integer (Int32)}
     */
    static PrintDocument => 100

    /**
     * The [RowDefinition](../windows.ui.xaml.controls/rowdefinition.md) type.
     * @type {Integer (Int32)}
     */
    static RowDefinition => 106

    /**
     * The [Style](../windows.ui.xaml/style.md) type.
     * @type {Integer (Int32)}
     */
    static Style => 114

    /**
     * The [TimelineMarker](../windows.ui.xaml.media/timelinemarker.md) type.
     * @type {Integer (Int32)}
     */
    static TimelineMarker => 126

    /**
     * The [VisualState](../windows.ui.xaml/visualstate.md) type.
     * @type {Integer (Int32)}
     */
    static VisualState => 137

    /**
     * The [VisualStateGroup](../windows.ui.xaml/visualstategroup.md) type.
     * @type {Integer (Int32)}
     */
    static VisualStateGroup => 138

    /**
     * The [VisualStateManager](../windows.ui.xaml/visualstatemanager.md) type.
     * @type {Integer (Int32)}
     */
    static VisualStateManager => 139

    /**
     * The [VisualTransition](../windows.ui.xaml/visualtransition.md) type.
     * @type {Integer (Int32)}
     */
    static VisualTransition => 140

    /**
     * The [AddDeleteThemeTransition](../windows.ui.xaml.media.animation/adddeletethemetransition.md) type.
     * @type {Integer (Int32)}
     */
    static AddDeleteThemeTransition => 177

    /**
     * The [ArcSegment](../windows.ui.xaml.media/arcsegment.md) type.
     * @type {Integer (Int32)}
     */
    static ArcSegment => 178

    /**
     * The [BackEase](../windows.ui.xaml.media.animation/backease.md) type.
     * @type {Integer (Int32)}
     */
    static BackEase => 179

    /**
     * The [BeginStoryboard](../windows.ui.xaml.media.animation/beginstoryboard.md) type.
     * @type {Integer (Int32)}
     */
    static BeginStoryboard => 180

    /**
     * The [BezierSegment](../windows.ui.xaml.media/beziersegment.md) type.
     * @type {Integer (Int32)}
     */
    static BezierSegment => 181

    /**
     * The [BindingBase](../windows.ui.xaml.data/bindingbase.md) type.
     * @type {Integer (Int32)}
     */
    static BindingBase => 182

    /**
     * The [BitmapCache](../windows.ui.xaml.media/bitmapcache.md) type.
     * @type {Integer (Int32)}
     */
    static BitmapCache => 183

    /**
     * The [BounceEase](../windows.ui.xaml.media.animation/bounceease.md) type.
     * @type {Integer (Int32)}
     */
    static BounceEase => 186

    /**
     * The [CircleEase](../windows.ui.xaml.media.animation/circleease.md) type.
     * @type {Integer (Int32)}
     */
    static CircleEase => 187

    /**
     * The [ColorAnimation](../windows.ui.xaml.media.animation/coloranimation.md) type.
     * @type {Integer (Int32)}
     */
    static ColorAnimation => 188

    /**
     * The [ColorAnimationUsingKeyFrames](../windows.ui.xaml.media.animation/coloranimationusingkeyframes.md) type.
     * @type {Integer (Int32)}
     */
    static ColorAnimationUsingKeyFrames => 189

    /**
     * The [ContentThemeTransition](../windows.ui.xaml.media.animation/contentthemetransition.md) type.
     * @type {Integer (Int32)}
     */
    static ContentThemeTransition => 190

    /**
     * The [ControlTemplate](../windows.ui.xaml.controls/controltemplate.md) type.
     * @type {Integer (Int32)}
     */
    static ControlTemplate => 191

    /**
     * The [CubicEase](../windows.ui.xaml.media.animation/cubicease.md) type.
     * @type {Integer (Int32)}
     */
    static CubicEase => 192

    /**
     * The [DataTemplate](../windows.ui.xaml/datatemplate.md) type.
     * @type {Integer (Int32)}
     */
    static DataTemplate => 194

    /**
     * The [DiscreteColorKeyFrame](../windows.ui.xaml.media.animation/discretecolorkeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static DiscreteColorKeyFrame => 195

    /**
     * The [DiscreteDoubleKeyFrame](../windows.ui.xaml.media.animation/discretedoublekeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static DiscreteDoubleKeyFrame => 196

    /**
     * The [DiscreteObjectKeyFrame](../windows.ui.xaml.media.animation/discreteobjectkeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static DiscreteObjectKeyFrame => 197

    /**
     * The [DiscretePointKeyFrame](../windows.ui.xaml.media.animation/discretepointkeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static DiscretePointKeyFrame => 198

    /**
     * The [DoubleAnimation](../windows.ui.xaml.media.animation/doubleanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DoubleAnimation => 200

    /**
     * The [DoubleAnimationUsingKeyFrames](../windows.ui.xaml.media.animation/doubleanimationusingkeyframes.md) type.
     * @type {Integer (Int32)}
     */
    static DoubleAnimationUsingKeyFrames => 201

    /**
     * The [EasingColorKeyFrame](../windows.ui.xaml.media.animation/easingcolorkeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static EasingColorKeyFrame => 204

    /**
     * The [EasingDoubleKeyFrame](../windows.ui.xaml.media.animation/easingdoublekeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static EasingDoubleKeyFrame => 205

    /**
     * The [EasingPointKeyFrame](../windows.ui.xaml.media.animation/easingpointkeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static EasingPointKeyFrame => 206

    /**
     * The [EdgeUIThemeTransition](../windows.ui.xaml.media.animation/edgeuithemetransition.md) type.
     * @type {Integer (Int32)}
     */
    static EdgeUIThemeTransition => 207

    /**
     * The [ElasticEase](../windows.ui.xaml.media.animation/elasticease.md) type.
     * @type {Integer (Int32)}
     */
    static ElasticEase => 208

    /**
     * The [EllipseGeometry](../windows.ui.xaml.media/ellipsegeometry.md) type.
     * @type {Integer (Int32)}
     */
    static EllipseGeometry => 209

    /**
     * The [EntranceThemeTransition](../windows.ui.xaml.media.animation/entrancethemetransition.md) type.
     * @type {Integer (Int32)}
     */
    static EntranceThemeTransition => 210

    /**
     * The [EventTrigger](../windows.ui.xaml/eventtrigger.md) type.
     * @type {Integer (Int32)}
     */
    static EventTrigger => 211

    /**
     * The [ExponentialEase](../windows.ui.xaml.media.animation/exponentialease.md) type.
     * @type {Integer (Int32)}
     */
    static ExponentialEase => 212

    /**
     * The [Flyout](../windows.ui.xaml.controls/flyout.md) type.
     * @type {Integer (Int32)}
     */
    static Flyout => 213

    /**
     * The [GeometryGroup](../windows.ui.xaml.media/geometrygroup.md) type.
     * @type {Integer (Int32)}
     */
    static GeometryGroup => 216

    /**
     * The [ItemsPanelTemplate](../windows.ui.xaml.controls/itemspaneltemplate.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsPanelTemplate => 227

    /**
     * The [LinearColorKeyFrame](../windows.ui.xaml.media.animation/linearcolorkeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static LinearColorKeyFrame => 230

    /**
     * The [LinearDoubleKeyFrame](../windows.ui.xaml.media.animation/lineardoublekeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static LinearDoubleKeyFrame => 231

    /**
     * The [LinearPointKeyFrame](../windows.ui.xaml.media.animation/linearpointkeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static LinearPointKeyFrame => 232

    /**
     * The [LineGeometry](../windows.ui.xaml.media/linegeometry.md) type.
     * @type {Integer (Int32)}
     */
    static LineGeometry => 233

    /**
     * The [LineSegment](../windows.ui.xaml.media/linesegment.md) type.
     * @type {Integer (Int32)}
     */
    static LineSegment => 234

    /**
     * The [Matrix3DProjection](../windows.ui.xaml.media/matrix3dprojection.md) type.
     * @type {Integer (Int32)}
     */
    static Matrix3DProjection => 236

    /**
     * The [MenuFlyout](../windows.ui.xaml.controls/menuflyout.md) type.
     * @type {Integer (Int32)}
     */
    static MenuFlyout => 238

    /**
     * The [ObjectAnimationUsingKeyFrames](../windows.ui.xaml.media.animation/objectanimationusingkeyframes.md) type.
     * @type {Integer (Int32)}
     */
    static ObjectAnimationUsingKeyFrames => 240

    /**
     * The [PaneThemeTransition](../windows.ui.xaml.media.animation/panethemetransition.md) type.
     * @type {Integer (Int32)}
     */
    static PaneThemeTransition => 241

    /**
     * The [PathGeometry](../windows.ui.xaml.media/pathgeometry.md) type.
     * @type {Integer (Int32)}
     */
    static PathGeometry => 243

    /**
     * The [PlaneProjection](../windows.ui.xaml.media/planeprojection.md) type.
     * @type {Integer (Int32)}
     */
    static PlaneProjection => 244

    /**
     * The [PointAnimation](../windows.ui.xaml.media.animation/pointanimation.md) type.
     * @type {Integer (Int32)}
     */
    static PointAnimation => 245

    /**
     * The [PointAnimationUsingKeyFrames](../windows.ui.xaml.media.animation/pointanimationusingkeyframes.md) type.
     * @type {Integer (Int32)}
     */
    static PointAnimationUsingKeyFrames => 246

    /**
     * The [PolyBezierSegment](../windows.ui.xaml.media/polybeziersegment.md) type.
     * @type {Integer (Int32)}
     */
    static PolyBezierSegment => 248

    /**
     * The [PolyLineSegment](../windows.ui.xaml.media/polylinesegment.md) type.
     * @type {Integer (Int32)}
     */
    static PolyLineSegment => 249

    /**
     * The [PolyQuadraticBezierSegment](../windows.ui.xaml.media/polyquadraticbeziersegment.md) type.
     * @type {Integer (Int32)}
     */
    static PolyQuadraticBezierSegment => 250

    /**
     * The [PopupThemeTransition](../windows.ui.xaml.media.animation/popupthemetransition.md) type.
     * @type {Integer (Int32)}
     */
    static PopupThemeTransition => 251

    /**
     * The [PowerEase](../windows.ui.xaml.media.animation/powerease.md) type.
     * @type {Integer (Int32)}
     */
    static PowerEase => 252

    /**
     * The [QuadraticBezierSegment](../windows.ui.xaml.media/quadraticbeziersegment.md) type.
     * @type {Integer (Int32)}
     */
    static QuadraticBezierSegment => 254

    /**
     * The [QuadraticEase](../windows.ui.xaml.media.animation/quadraticease.md) type.
     * @type {Integer (Int32)}
     */
    static QuadraticEase => 255

    /**
     * The [QuarticEase](../windows.ui.xaml.media.animation/quarticease.md) type.
     * @type {Integer (Int32)}
     */
    static QuarticEase => 256

    /**
     * The [QuinticEase](../windows.ui.xaml.media.animation/quinticease.md) type.
     * @type {Integer (Int32)}
     */
    static QuinticEase => 257

    /**
     * The [RectangleGeometry](../windows.ui.xaml.media/rectanglegeometry.md) type.
     * @type {Integer (Int32)}
     */
    static RectangleGeometry => 258

    /**
     * The [RelativeSource](../windows.ui.xaml.data/relativesource.md) type.
     * @type {Integer (Int32)}
     */
    static RelativeSource => 259

    /**
     * The [RenderTargetBitmap](../windows.ui.xaml.media.imaging/rendertargetbitmap.md) type.
     * @type {Integer (Int32)}
     */
    static RenderTargetBitmap => 260

    /**
     * The [ReorderThemeTransition](../windows.ui.xaml.media.animation/reorderthemetransition.md) type.
     * @type {Integer (Int32)}
     */
    static ReorderThemeTransition => 261

    /**
     * The [RepositionThemeTransition](../windows.ui.xaml.media.animation/repositionthemetransition.md) type.
     * @type {Integer (Int32)}
     */
    static RepositionThemeTransition => 262

    /**
     * The [Setter](../windows.ui.xaml/setter.md) type.
     * @type {Integer (Int32)}
     */
    static Setter => 263

    /**
     * The [SineEase](../windows.ui.xaml.media.animation/sineease.md) type.
     * @type {Integer (Int32)}
     */
    static SineEase => 264

    /**
     * The [SolidColorBrush](../windows.ui.xaml.media/solidcolorbrush.md) type.
     * @type {Integer (Int32)}
     */
    static SolidColorBrush => 265

    /**
     * The [SplineColorKeyFrame](../windows.ui.xaml.media.animation/splinecolorkeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static SplineColorKeyFrame => 266

    /**
     * The [SplineDoubleKeyFrame](../windows.ui.xaml.media.animation/splinedoublekeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static SplineDoubleKeyFrame => 267

    /**
     * The [SplinePointKeyFrame](../windows.ui.xaml.media.animation/splinepointkeyframe.md) type.
     * @type {Integer (Int32)}
     */
    static SplinePointKeyFrame => 268

    /**
     * The [BitmapImage](../windows.ui.xaml.media.imaging/bitmapimage.md) type.
     * @type {Integer (Int32)}
     */
    static BitmapImage => 285

    /**
     * The [Border](../windows.ui.xaml.controls/border.md) type.
     * @type {Integer (Int32)}
     */
    static Border => 286

    /**
     * The [CaptureElement](../windows.ui.xaml.controls/captureelement.md) type.
     * @type {Integer (Int32)}
     */
    static CaptureElement => 288

    /**
     * The [CompositeTransform](../windows.ui.xaml.media/compositetransform.md) type.
     * @type {Integer (Int32)}
     */
    static CompositeTransform => 295

    /**
     * The [ContentPresenter](../windows.ui.xaml.controls/contentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ContentPresenter => 296

    /**
     * The [DragItemThemeAnimation](../windows.ui.xaml.media.animation/dragitemthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DragItemThemeAnimation => 302

    /**
     * The [DragOverThemeAnimation](../windows.ui.xaml.media.animation/dragoverthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DragOverThemeAnimation => 303

    /**
     * The [DropTargetItemThemeAnimation](../windows.ui.xaml.media.animation/droptargetitemthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DropTargetItemThemeAnimation => 304

    /**
     * The [FadeInThemeAnimation](../windows.ui.xaml.media.animation/fadeinthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static FadeInThemeAnimation => 306

    /**
     * The [FadeOutThemeAnimation](../windows.ui.xaml.media.animation/fadeoutthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static FadeOutThemeAnimation => 307

    /**
     * The [Glyphs](../windows.ui.xaml.documents/glyphs.md) type.
     * @type {Integer (Int32)}
     */
    static Glyphs => 312

    /**
     * The [Image](../windows.ui.xaml.controls/image.md) type.
     * @type {Integer (Int32)}
     */
    static Image => 326

    /**
     * The [ImageBrush](../windows.ui.xaml.media/imagebrush.md) type.
     * @type {Integer (Int32)}
     */
    static ImageBrush => 328

    /**
     * The [InlineUIContainer](../windows.ui.xaml.documents/inlineuicontainer.md) type.
     * @type {Integer (Int32)}
     */
    static InlineUIContainer => 329

    /**
     * The [ItemsPresenter](../windows.ui.xaml.controls/itemspresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsPresenter => 332

    /**
     * The [LinearGradientBrush](../windows.ui.xaml.media/lineargradientbrush.md) type.
     * @type {Integer (Int32)}
     */
    static LinearGradientBrush => 334

    /**
     * The [LineBreak](../windows.ui.xaml.documents/linebreak.md) type.
     * @type {Integer (Int32)}
     */
    static LineBreak => 335

    /**
     * The [MatrixTransform](../windows.ui.xaml.media/matrixtransform.md) type.
     * @type {Integer (Int32)}
     */
    static MatrixTransform => 340

    /**
     * The [MediaElement](../windows.ui.xaml.controls/mediaelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaElement => 342

    /**
     * The [Paragraph](../windows.ui.xaml.documents/paragraph.md) type.
     * @type {Integer (Int32)}
     */
    static Paragraph => 349

    /**
     * The [PointerDownThemeAnimation](../windows.ui.xaml.media.animation/pointerdownthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static PointerDownThemeAnimation => 357

    /**
     * The [PointerUpThemeAnimation](../windows.ui.xaml.media.animation/pointerupthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static PointerUpThemeAnimation => 359

    /**
     * The [PopInThemeAnimation](../windows.ui.xaml.media.animation/popinthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static PopInThemeAnimation => 361

    /**
     * The [PopOutThemeAnimation](../windows.ui.xaml.media.animation/popoutthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static PopOutThemeAnimation => 362

    /**
     * The [Popup](../windows.ui.xaml.controls.primitives/popup.md) type.
     * @type {Integer (Int32)}
     */
    static Popup => 363

    /**
     * The [RepositionThemeAnimation](../windows.ui.xaml.media.animation/repositionthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static RepositionThemeAnimation => 370

    /**
     * The [ResourceDictionary](../windows.ui.xaml/resourcedictionary.md) type.
     * @type {Integer (Int32)}
     */
    static ResourceDictionary => 371

    /**
     * The [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlock => 374

    /**
     * The [RichTextBlockOverflow](../windows.ui.xaml.controls/richtextblockoverflow.md) type.
     * @type {Integer (Int32)}
     */
    static RichTextBlockOverflow => 376

    /**
     * The [RotateTransform](../windows.ui.xaml.media/rotatetransform.md) type.
     * @type {Integer (Int32)}
     */
    static RotateTransform => 378

    /**
     * The [Run](../windows.ui.xaml.documents/run.md) type.
     * @type {Integer (Int32)}
     */
    static Run => 380

    /**
     * The [ScaleTransform](../windows.ui.xaml.media/scaletransform.md) type.
     * @type {Integer (Int32)}
     */
    static ScaleTransform => 381

    /**
     * The [SkewTransform](../windows.ui.xaml.media/skewtransform.md) type.
     * @type {Integer (Int32)}
     */
    static SkewTransform => 389

    /**
     * The [Span](../windows.ui.xaml.documents/span.md) type.
     * @type {Integer (Int32)}
     */
    static Span => 390

    /**
     * The [SplitCloseThemeAnimation](../windows.ui.xaml.media.animation/splitclosethemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitCloseThemeAnimation => 391

    /**
     * The [SplitOpenThemeAnimation](../windows.ui.xaml.media.animation/splitopenthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SplitOpenThemeAnimation => 392

    /**
     * The [Storyboard](../windows.ui.xaml.media.animation/storyboard.md) type.
     * @type {Integer (Int32)}
     */
    static Storyboard => 393

    /**
     * The [SwipeBackThemeAnimation](../windows.ui.xaml.media.animation/swipebackthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SwipeBackThemeAnimation => 394

    /**
     * The [SwipeHintThemeAnimation](../windows.ui.xaml.media.animation/swipehintthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static SwipeHintThemeAnimation => 395

    /**
     * The [TextBlock](../windows.ui.xaml.controls/textblock.md) type.
     * @type {Integer (Int32)}
     */
    static TextBlock => 396

    /**
     * The [TransformGroup](../windows.ui.xaml.media/transformgroup.md) type.
     * @type {Integer (Int32)}
     */
    static TransformGroup => 411

    /**
     * The [TranslateTransform](../windows.ui.xaml.media/translatetransform.md) type.
     * @type {Integer (Int32)}
     */
    static TranslateTransform => 413

    /**
     * The [Viewbox](../windows.ui.xaml.controls/viewbox.md) type.
     * @type {Integer (Int32)}
     */
    static Viewbox => 417

    /**
     * The [WebViewBrush](../windows.ui.xaml.controls/webviewbrush.md) type.
     * @type {Integer (Int32)}
     */
    static WebViewBrush => 423

    /**
     * The [AppBarSeparator](../windows.ui.xaml.controls/appbarseparator.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarSeparator => 427

    /**
     * The [BitmapIcon](../windows.ui.xaml.controls/bitmapicon.md) type.
     * @type {Integer (Int32)}
     */
    static BitmapIcon => 429

    /**
     * The [Bold](../windows.ui.xaml.documents/bold.md) type.
     * @type {Integer (Int32)}
     */
    static Bold => 430

    /**
     * The [Canvas](../windows.ui.xaml.controls/canvas.md) type.
     * @type {Integer (Int32)}
     */
    static Canvas => 432

    /**
     * The [ContentControl](../windows.ui.xaml.controls/contentcontrol.md) type.
     * @type {Integer (Int32)}
     */
    static ContentControl => 435

    /**
     * The [DatePicker](../windows.ui.xaml.controls/datepicker.md) type.
     * @type {Integer (Int32)}
     */
    static DatePicker => 436

    /**
     * The [DependencyObjectCollection](../windows.ui.xaml/dependencyobjectcollection.md) type.
     * @type {Integer (Int32)}
     */
    static DependencyObjectCollection => 437

    /**
     * The [Ellipse](../windows.ui.xaml.shapes/ellipse.md) type.
     * @type {Integer (Int32)}
     */
    static Ellipse => 438

    /**
     * The [FontIcon](../windows.ui.xaml.controls/fonticon.md) type.
     * @type {Integer (Int32)}
     */
    static FontIcon => 440

    /**
     * The [Grid](../windows.ui.xaml.controls/grid.md) type.
     * @type {Integer (Int32)}
     */
    static Grid => 442

    /**
     * The [Hub](../windows.ui.xaml.controls/hub.md) type.
     * @type {Integer (Int32)}
     */
    static Hub => 445

    /**
     * The [HubSection](../windows.ui.xaml.controls/hubsection.md) type.
     * @type {Integer (Int32)}
     */
    static HubSection => 446

    /**
     * The [Hyperlink](../windows.ui.xaml.documents/hyperlink.md) type.
     * @type {Integer (Int32)}
     */
    static Hyperlink => 447

    /**
     * The [Italic](../windows.ui.xaml.documents/italic.md) type.
     * @type {Integer (Int32)}
     */
    static Italic => 449

    /**
     * The [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsControl => 451

    /**
     * The [Line](../windows.ui.xaml.shapes/line.md) type.
     * @type {Integer (Int32)}
     */
    static Line => 452

    /**
     * The [MediaTransportControls](../windows.ui.xaml.controls/mediatransportcontrols.md) type.
     * @type {Integer (Int32)}
     */
    static MediaTransportControls => 458

    /**
     * The [PasswordBox](../windows.ui.xaml.controls/passwordbox.md) type.
     * @type {Integer (Int32)}
     */
    static PasswordBox => 462

    /**
     * The [Path](../windows.ui.xaml.shapes/path.md) type.
     * @type {Integer (Int32)}
     */
    static Path => 463

    /**
     * The [PathIcon](../windows.ui.xaml.controls/pathicon.md) type.
     * @type {Integer (Int32)}
     */
    static PathIcon => 464

    /**
     * The [Polygon](../windows.ui.xaml.shapes/polygon.md) type.
     * @type {Integer (Int32)}
     */
    static Polygon => 465

    /**
     * The [Polyline](../windows.ui.xaml.shapes/polyline.md) type.
     * @type {Integer (Int32)}
     */
    static Polyline => 466

    /**
     * The [ProgressRing](../windows.ui.xaml.controls/progressring.md) type.
     * @type {Integer (Int32)}
     */
    static ProgressRing => 468

    /**
     * The [Rectangle](../windows.ui.xaml.shapes/rectangle.md) type.
     * @type {Integer (Int32)}
     */
    static Rectangle => 470

    /**
     * The [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) type.
     * @type {Integer (Int32)}
     */
    static RichEditBox => 473

    /**
     * The [ScrollContentPresenter](../windows.ui.xaml.controls/scrollcontentpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollContentPresenter => 476

    /**
     * The [SearchBox](../windows.ui.xaml.controls/searchbox.md) type.
     * @type {Integer (Int32)}
     */
    static SearchBox => 477

    /**
     * The [SemanticZoom](../windows.ui.xaml.controls/semanticzoom.md) type.
     * @type {Integer (Int32)}
     */
    static SemanticZoom => 479

    /**
     * The [StackPanel](../windows.ui.xaml.controls/stackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static StackPanel => 481

    /**
     * The [SymbolIcon](../windows.ui.xaml.controls/symbolicon.md) type.
     * @type {Integer (Int32)}
     */
    static SymbolIcon => 482

    /**
     * The [TextBox](../windows.ui.xaml.controls/textbox.md) type.
     * @type {Integer (Int32)}
     */
    static TextBox => 483

    /**
     * The [Thumb](../windows.ui.xaml.controls.primitives/thumb.md) type.
     * @type {Integer (Int32)}
     */
    static Thumb => 485

    /**
     * The [TickBar](../windows.ui.xaml.controls.primitives/tickbar.md) type.
     * @type {Integer (Int32)}
     */
    static TickBar => 486

    /**
     * The [TimePicker](../windows.ui.xaml.controls/timepicker.md) type.
     * @type {Integer (Int32)}
     */
    static TimePicker => 487

    /**
     * The [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleSwitch => 489

    /**
     * The [Underline](../windows.ui.xaml.documents/underline.md) type.
     * @type {Integer (Int32)}
     */
    static Underline => 490

    /**
     * The [UserControl](../windows.ui.xaml.controls/usercontrol.md) type.
     * @type {Integer (Int32)}
     */
    static UserControl => 491

    /**
     * The [VariableSizedWrapGrid](../windows.ui.xaml.controls/variablesizedwrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static VariableSizedWrapGrid => 492

    /**
     * The [WebView](../windows.ui.xaml.controls/webview.md) type.
     * @type {Integer (Int32)}
     */
    static WebView => 494

    /**
     * The [AppBar](../windows.ui.xaml.controls/appbar.md) type.
     * @type {Integer (Int32)}
     */
    static AppBar => 495

    /**
     * The [AutoSuggestBox](../windows.ui.xaml.controls/autosuggestbox.md) type.
     * @type {Integer (Int32)}
     */
    static AutoSuggestBox => 499

    /**
     * The [CarouselPanel](../windows.ui.xaml.controls.primitives/carouselpanel.md) type.
     * @type {Integer (Int32)}
     */
    static CarouselPanel => 502

    /**
     * The [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) type.
     * @type {Integer (Int32)}
     */
    static ContentDialog => 506

    /**
     * The [FlyoutPresenter](../windows.ui.xaml.controls/flyoutpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static FlyoutPresenter => 508

    /**
     * The [Frame](../windows.ui.xaml.controls/frame.md) type.
     * @type {Integer (Int32)}
     */
    static Frame => 509

    /**
     * The [GridViewItemPresenter](../windows.ui.xaml.controls.primitives/gridviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItemPresenter => 511

    /**
     * The [GroupItem](../windows.ui.xaml.controls/groupitem.md) type.
     * @type {Integer (Int32)}
     */
    static GroupItem => 512

    /**
     * The [ItemsStackPanel](../windows.ui.xaml.controls/itemsstackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsStackPanel => 514

    /**
     * The [ItemsWrapGrid](../windows.ui.xaml.controls/itemswrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static ItemsWrapGrid => 515

    /**
     * The [ListViewItemPresenter](../windows.ui.xaml.controls.primitives/listviewitempresenter.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItemPresenter => 520

    /**
     * The [MenuFlyoutItem](../windows.ui.xaml.controls/menuflyoutitem.md) type.
     * @type {Integer (Int32)}
     */
    static MenuFlyoutItem => 521

    /**
     * The [MenuFlyoutPresenter](../windows.ui.xaml.controls/menuflyoutpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static MenuFlyoutPresenter => 522

    /**
     * The [MenuFlyoutSeparator](../windows.ui.xaml.controls/menuflyoutseparator.md) type.
     * @type {Integer (Int32)}
     */
    static MenuFlyoutSeparator => 523

    /**
     * The [Page](../windows.ui.xaml.controls/page.md) type.
     * @type {Integer (Int32)}
     */
    static Page => 525

    /**
     * The [ProgressBar](../windows.ui.xaml.controls/progressbar.md) type.
     * @type {Integer (Int32)}
     */
    static ProgressBar => 528

    /**
     * The [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollBar => 530

    /**
     * The [SettingsFlyout](../windows.ui.xaml.controls/settingsflyout.md) type.
     * @type {Integer (Int32)}
     */
    static SettingsFlyout => 533

    /**
     * The [Slider](../windows.ui.xaml.controls/slider.md) type.
     * @type {Integer (Int32)}
     */
    static Slider => 534

    /**
     * The [SwapChainBackgroundPanel](../windows.ui.xaml.controls/swapchainbackgroundpanel.md) type.
     * @type {Integer (Int32)}
     */
    static SwapChainBackgroundPanel => 535

    /**
     * The [SwapChainPanel](../windows.ui.xaml.controls/swapchainpanel.md) type.
     * @type {Integer (Int32)}
     */
    static SwapChainPanel => 536

    /**
     * The [ToolTip](../windows.ui.xaml.controls/tooltip.md) type.
     * @type {Integer (Int32)}
     */
    static ToolTip => 538

    /**
     * The [Button](../windows.ui.xaml.controls/button.md) type.
     * @type {Integer (Int32)}
     */
    static Button => 540

    /**
     * The [ComboBoxItem](../windows.ui.xaml.controls/comboboxitem.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBoxItem => 541

    /**
     * The [CommandBar](../windows.ui.xaml.controls/commandbar.md) type.
     * @type {Integer (Int32)}
     */
    static CommandBar => 542

    /**
     * The [FlipViewItem](../windows.ui.xaml.controls/flipviewitem.md) type.
     * @type {Integer (Int32)}
     */
    static FlipViewItem => 543

    /**
     * The [GridViewHeaderItem](../windows.ui.xaml.controls/gridviewheaderitem.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewHeaderItem => 545

    /**
     * The [HyperlinkButton](../windows.ui.xaml.controls/hyperlinkbutton.md) type.
     * @type {Integer (Int32)}
     */
    static HyperlinkButton => 546

    /**
     * The [ListBoxItem](../windows.ui.xaml.controls/listboxitem.md) type.
     * @type {Integer (Int32)}
     */
    static ListBoxItem => 547

    /**
     * The [ListViewHeaderItem](../windows.ui.xaml.controls/listviewheaderitem.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewHeaderItem => 550

    /**
     * The [RepeatButton](../windows.ui.xaml.controls.primitives/repeatbutton.md) type.
     * @type {Integer (Int32)}
     */
    static RepeatButton => 551

    /**
     * The [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) type.
     * @type {Integer (Int32)}
     */
    static ScrollViewer => 552

    /**
     * The [ToggleButton](../windows.ui.xaml.controls.primitives/togglebutton.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleButton => 553

    /**
     * The [ToggleMenuFlyoutItem](../windows.ui.xaml.controls/togglemenuflyoutitem.md) type.
     * @type {Integer (Int32)}
     */
    static ToggleMenuFlyoutItem => 554

    /**
     * The [VirtualizingStackPanel](../windows.ui.xaml.controls/virtualizingstackpanel.md) type.
     * @type {Integer (Int32)}
     */
    static VirtualizingStackPanel => 555

    /**
     * The [WrapGrid](../windows.ui.xaml.controls/wrapgrid.md) type.
     * @type {Integer (Int32)}
     */
    static WrapGrid => 556

    /**
     * The [AppBarButton](../windows.ui.xaml.controls/appbarbutton.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarButton => 557

    /**
     * The [AppBarToggleButton](../windows.ui.xaml.controls/appbartogglebutton.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarToggleButton => 558

    /**
     * The [CheckBox](../windows.ui.xaml.controls/checkbox.md) type.
     * @type {Integer (Int32)}
     */
    static CheckBox => 559

    /**
     * The [GridViewItem](../windows.ui.xaml.controls/gridviewitem.md) type.
     * @type {Integer (Int32)}
     */
    static GridViewItem => 560

    /**
     * The [ListViewItem](../windows.ui.xaml.controls/listviewitem.md) type.
     * @type {Integer (Int32)}
     */
    static ListViewItem => 561

    /**
     * The [RadioButton](../windows.ui.xaml.controls/radiobutton.md) type.
     * @type {Integer (Int32)}
     */
    static RadioButton => 562

    /**
     * The [Binding](../windows.ui.xaml.data/binding.md) type.
     * @type {Integer (Int32)}
     */
    static Binding => 564

    /**
     * The [ComboBox](../windows.ui.xaml.controls/combobox.md) type.
     * @type {Integer (Int32)}
     */
    static ComboBox => 566

    /**
     * The [FlipView](../windows.ui.xaml.controls/flipview.md) type.
     * @type {Integer (Int32)}
     */
    static FlipView => 567

    /**
     * The [ListBox](../windows.ui.xaml.controls/listbox.md) type.
     * @type {Integer (Int32)}
     */
    static ListBox => 568

    /**
     * The [GridView](../windows.ui.xaml.controls/gridview.md) type.
     * @type {Integer (Int32)}
     */
    static GridView => 570

    /**
     * The [ListView](../windows.ui.xaml.controls/listview.md) type.
     * @type {Integer (Int32)}
     */
    static ListView => 571

    /**
     * The [CalendarView](../windows.ui.xaml.controls/calendarview.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarView => 707

    /**
     * The [CalendarViewDayItem](../windows.ui.xaml.controls/calendarviewdayitem.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarViewDayItem => 709

    /**
     * The [CalendarPanel](../windows.ui.xaml.controls.primitives/calendarpanel.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarPanel => 723

    /**
     * The [SplitView](../windows.ui.xaml.controls/splitview.md) type.
     * @type {Integer (Int32)}
     */
    static SplitView => 728

    /**
     * The [CompositeTransform3D](../windows.ui.xaml.media.media3d/compositetransform3d.md) type.
     * @type {Integer (Int32)}
     */
    static CompositeTransform3D => 732

    /**
     * The [PerspectiveTransform3D](../windows.ui.xaml.media.media3d/perspectivetransform3d.md) type.
     * @type {Integer (Int32)}
     */
    static PerspectiveTransform3D => 733

    /**
     * The [RelativePanel](../windows.ui.xaml.controls/relativepanel.md) type.
     * @type {Integer (Int32)}
     */
    static RelativePanel => 744

    /**
     * The [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) type.
     * @type {Integer (Int32)}
     */
    static InkCanvas => 748

    /**
     * The [MenuFlyoutSubItem](../windows.ui.xaml.controls/menuflyoutsubitem.md) type.
     * @type {Integer (Int32)}
     */
    static MenuFlyoutSubItem => 749

    /**
     * The [AdaptiveTrigger](../windows.ui.xaml/adaptivetrigger.md) type.
     * @type {Integer (Int32)}
     */
    static AdaptiveTrigger => 757

    /**
     * The [SoftwareBitmapSource](../windows.ui.xaml.media.imaging/softwarebitmapsource.md) type.
     * @type {Integer (Int32)}
     */
    static SoftwareBitmapSource => 761

    /**
     * The [StateTrigger](../windows.ui.xaml/statetrigger.md) type.
     * @type {Integer (Int32)}
     */
    static StateTrigger => 767

    /**
     * The [CalendarDatePicker](../windows.ui.xaml.controls/calendardatepicker.md) type.
     * @type {Integer (Int32)}
     */
    static CalendarDatePicker => 774

    /**
     * The [AutoSuggestBoxQuerySubmittedEventArgs](../windows.ui.xaml.controls/autosuggestboxquerysubmittedeventargs.md) type.
     * @type {Integer (Int32)}
     */
    static AutoSuggestBoxQuerySubmittedEventArgs => 778

    /**
     * The [CommandBarOverflowPresenter](../windows.ui.xaml.controls/commandbaroverflowpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static CommandBarOverflowPresenter => 781

    /**
     * The [DrillInThemeAnimation](../windows.ui.xaml.media.animation/drillinthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DrillInThemeAnimation => 782

    /**
     * The [DrillOutThemeAnimation](../windows.ui.xaml.media.animation/drilloutthemeanimation.md) type.
     * @type {Integer (Int32)}
     */
    static DrillOutThemeAnimation => 783

    /**
     * The [AutomationAnnotation](../windows.ui.xaml.automation/automationannotation.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationAnnotation => 789

    /**
     * The [AutomationPeerAnnotation](../windows.ui.xaml.automation.peers/automationpeerannotation.md) type.
     * @type {Integer (Int32)}
     */
    static AutomationPeerAnnotation => 790

    /**
     * The [MediaPlayerPresenter](../windows.ui.xaml.controls/mediaplayerpresenter.md) type.
     * @type {Integer (Int32)}
     */
    static MediaPlayerPresenter => 828

    /**
     * The [MediaPlayerElement](../windows.ui.xaml.controls/mediaplayerelement.md) type.
     * @type {Integer (Int32)}
     */
    static MediaPlayerElement => 829

    /**
     * The [XamlLight](../windows.ui.xaml.media/xamllight.md) type.
     * @type {Integer (Int32)}
     */
    static XamlLight => 855

    /**
     * The [SvgImageSource](../windows.ui.xaml.media.imaging/svgimagesource.md) type.
     * @type {Integer (Int32)}
     */
    static SvgImageSource => 860

    /**
     * The [KeyboardAccelerator](../windows.ui.xaml.input/keyboardaccelerator.md) type.
     * @type {Integer (Int32)}
     */
    static KeyboardAccelerator => 897

    /**
     * The [HandwritingView](../windows.ui.xaml.controls/handwritingview.md) type.
     * @type {Integer (Int32)}
     */
    static HandwritingView => 920

    /**
     * The [ContentLink](../windows.ui.xaml.documents/contentlink.md) type.
     * @type {Integer (Int32)}
     */
    static ContentLink => 925

    /**
     * The [BitmapIconSource](../windows.ui.xaml.controls/bitmapiconsource.md) type.
     * @type {Integer (Int32)}
     */
    static BitmapIconSource => 929

    /**
     * The [FontIconSource](../windows.ui.xaml.controls/fonticonsource.md) type.
     * @type {Integer (Int32)}
     */
    static FontIconSource => 930

    /**
     * The [PathIconSource](../windows.ui.xaml.controls/pathiconsource.md) type.
     * @type {Integer (Int32)}
     */
    static PathIconSource => 931

    /**
     * The [SymbolIconSource](../windows.ui.xaml.controls/symboliconsource.md) type.
     * @type {Integer (Int32)}
     */
    static SymbolIconSource => 933

    /**
     * The [IconSourceElement](../windows.ui.xaml.controls/iconsourceelement.md) type.
     * @type {Integer (Int32)}
     */
    static IconSourceElement => 939

    /**
     * The [AppBarElementContainer](../windows.ui.xaml.controls/appbarelementcontainer.md) type.
     * @type {Integer (Int32)}
     */
    static AppBarElementContainer => 945

    /**
     * The [ColorPaletteResources](../windows.ui.xaml/colorpaletteresources.md) type.
     * @type {Integer (Int32)}
     */
    static ColorPaletteResources => 952

    /**
     * The [StandardUICommand](../windows.ui.xaml.input/standarduicommand.md) type.
     * @type {Integer (Int32)}
     */
    static StandardUICommand => 961

    /**
     * The [ThemeShadow](../windows.ui.xaml.media/ThemeShadow.md) type.
     * @type {Integer (Int32)}
     */
    static ThemeShadow => 964

    /**
     * The [XamlUICommand](../windows.ui.xaml.input/xamluicommand.md) type.
     * @type {Integer (Int32)}
     */
    static XamlUICommand => 969
}
