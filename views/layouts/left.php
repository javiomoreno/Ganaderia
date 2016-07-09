<aside class="main-sidebar">

    <section class="sidebar">

        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<?= $directoryAsset ?>/img/user2-160x160.jpg" class="img-circle" alt="User Image"/>
            </div>
            <div class="pull-left info">
                <p>Alexander Pierce</p>

                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>

        <?= dmstr\widgets\Menu::widget(
            [
                'options' => ['class' => 'sidebar-menu'],
                'items' => [
                    ['label' => 'Menu', 'options' => ['class' => 'header']],
                    ['label' => 'Inicio', 'icon' => 'fa fa-home', 'url' => ['/administrador/index']],
                    [
                        'label' => 'Gestionar',
                        'icon' => 'fa fa-cog',
                        'url' => '#',
                        'items' => [
                            ['label' => 'Usuarios', 'icon' => 'fa fa-check', 'url' => ['/usuarios/index'],],
                            ['label' => 'Pastos', 'icon' => 'fa fa-check', 'url' => ['/pastos/index'],],
                            ['label' => 'Suelos', 'icon' => 'fa fa-check', 'url' => ['/suelos/index'],],
                            ['label' => 'Ganado', 'icon' => 'fa fa-check', 'url' => ['/ganados/index'],],
                            ['label' => 'Lineamientos', 'icon' => 'fa fa-check', 'url' => ['/debug'],],
                        ],
                    ],
                ],
            ]
        ) ?>

    </section>

</aside>
